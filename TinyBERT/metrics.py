import logging
import argparse
import pandas as pd
import shlex
import numpy as np
import torch
import matplotlib.pyplot as plt
import os

logger = logging.getLogger()

EXPERIMENTS_DIR = "./"
EVAL_RESULTS_DIR = f"{EXPERIMENTS_DIR}/eval_results/"
LOGS_DIR = f"{EXPERIMENTS_DIR}/logs/"
LOGITS_CSV_NAME = "eval_results.csv"

CONFIG_TASK_NAME = 'TASK_NAME'
CONFIG_MODEL_NAME = 'MODEL_NAME'
CONFIG_BERT_BASE_DIR_NAME = 'BERT_BASE_DIR'


def get_loss():
    pass

def pairwise_conf_delta(logits_teacher_fname, logits_student_fname):
    # teacher
    # print(logits_teacher_fname)
    df_teacher = pd.read_csv(logits_teacher_fname)
    accuracy_teacher = len(df_teacher[df_teacher['pred']==df_teacher['label']])/len(df_teacher['pred'])
    # print(f"B: ")
    # print(f'    accuracy_teacher = {accuracy_teacher}')

    # student 
    df_student = pd.read_csv(logits_student_fname)
    accuracy_student = len(df_student[df_student['pred']==df_student['label']])/len(df_student['pred'])
    # print(f"S:")
    # print(f'    accuracy_student = {accuracy_student}')

    
    # teacher vs student 
    df_teacher.columns = ['pred_baseline', 'p0_baseline', 'p1_baseline', 'label']
    df_student.columns = ['pred_distill', 'p0_distill', 'p1_distill', 'label_']
    _ = pd.concat([df_teacher, df_student], axis=1)
    _correct = _[(_.pred_baseline == _.label) & (_.pred_distill == _.label)]
    delta_confidence_p0 = _correct.p0_baseline - _correct.p0_distill
    # print(f"B vs S:")
    # print(f"    Sigma confidence delta: {np.std(delta_confidence_p0)}")

    return accuracy_teacher, accuracy_student, np.std(delta_confidence_p0)
   


def ece(filename, display=False, n_bins=10):
    ece = 0
    avg_confidence_in_bin_list = []
    accuracy_in_bin_list = []
    bin_boundaries = torch.linspace(0, 1, n_bins + 1)
    bin_lowers = bin_boundaries[:-1]
    bin_uppers = bin_boundaries[1:]

    df = pd.read_csv(filename)
    confidence_class0 = df.p0
    confidence_class1 = df.p1

    predictions_class0 = pd.Series(np.zeros(confidence_class0.shape))
    predictions_class1 = pd.Series(np.ones(confidence_class1.shape))
    
    accuracies_class0 = predictions_class0==df.label
    accuracies_class1 = predictions_class1==df.label
    
    
    accuracies = pd.concat([accuracies_class0, accuracies_class1])
    confidences = pd.concat([confidence_class0, confidence_class1])
    predictions = pd.concat([predictions_class0, predictions_class1])
    
    for bin_lower, bin_upper in zip(bin_lowers, bin_uppers):
        # Calculated |confidence - accuracy| in each bin
        in_bin = confidences.gt(bin_lower.item()) * confidences.le(bin_upper.item())
        prop_in_bin = in_bin.mean()
    #     print(f"upper = {bin_lower.item()}, lowe={bin_upper.item()}")
    #     print(prop_in_bin)
        if prop_in_bin > 0:
            accuracy_in_bin = accuracies[in_bin].mean()
            avg_confidence_in_bin = confidences[in_bin].mean()
            ece += np.abs(avg_confidence_in_bin - accuracy_in_bin) * prop_in_bin
            avg_confidence_in_bin_list.append(avg_confidence_in_bin)
            accuracy_in_bin_list.append(accuracy_in_bin)
    filename_str = '/'.join(filename.split('/')[6:])
    # print(f'{filename_str}: {ece*100}')
    
    if display:
        f, ax = plt.subplots(figsize=(4, 4))
        ax.plot(avg_confidence_in_bin_list, accuracy_in_bin_list)
        ax.plot(ax.get_xlim(), ax.get_ylim(), ls="--", c=".3")
        plt.xlabel('confidence', fontsize=12)
        plt.ylabel('accuracy', fontsize=12)
        plt.show()
    return ece


def get_metrics(experiment_id):
    task_name = ""
    teacher_model_name = ""
    student_model_name = ""

    config_filename = f"{EXPERIMENTS_DIR}{experiment_id}.sh"

    with open(config_filename) as f:
        processed = f.read().replace('export ', '')
    for line in shlex.split(processed):
        key,_,value = line.partition('=')
        if key == CONFIG_TASK_NAME:
            task_name = value
        elif key == CONFIG_MODEL_NAME:
            student_model_name = value
        elif key == CONFIG_BERT_BASE_DIR_NAME:
            teacher_model_name = value.split('/')[-1]

# 

    # print(f" task_name = {task_name}, student_model_name = {student_model_name}, teacher_model_name = {teacher_model_name},")

    # logit files (teacher)
    teacher_logits_eval_on_train_filename = f"{EVAL_RESULTS_DIR}/{teacher_model_name}/{task_name}_on_train/{LOGITS_CSV_NAME}"
    teacher_logits_eval_on_eval_filename = f"{EVAL_RESULTS_DIR}/{teacher_model_name}/{task_name}_on_eval/{LOGITS_CSV_NAME}"

    # logit files (student)
    student_logits_eval_on_train_filename = f"{EVAL_RESULTS_DIR}/{experiment_id}_on_train/{LOGITS_CSV_NAME}"
    student_logits_eval_on_eval_filename = f"{EVAL_RESULTS_DIR}/{experiment_id}_on_eval/{LOGITS_CSV_NAME}"

    # ECE
    teacher_ecc_eval_on_train = ece(teacher_logits_eval_on_train_filename)
    teacher_ecc_eval_on_eval = ece(teacher_logits_eval_on_eval_filename)       
    student_ecc_eval_on_train = ece(student_logits_eval_on_train_filename)
    student_ecc_eval_on_eval = ece(student_logits_eval_on_eval_filename)    

    # print(f"teacher_ecc_eval_on_train={teacher_ecc_eval_on_train}, teacher_ecc_eval_on_eval={teacher_ecc_eval_on_eval}")
    # print(f"student_ecc_eval_on_train={student_ecc_eval_on_train}, student_ecc_eval_on_eval={student_ecc_eval_on_eval}")

    # pairwise
    accuracy_teacher_on_train, accuracy_student_on_train, pairwise_confidence_delta_on_train = pairwise_conf_delta(teacher_logits_eval_on_train_filename, student_logits_eval_on_train_filename)
    accuracy_teacher_on_eval, accuracy_student_on_eval, pairwise_confidence_delta_on_eval = pairwise_conf_delta(teacher_logits_eval_on_eval_filename, student_logits_eval_on_eval_filename)

    # print(f"accuracy_teacher_on_train={accuracy_teacher_on_train}, accuracy_student_on_train={accuracy_student_on_train}, pairwise_confidence_delta_on_train={pairwise_confidence_delta_on_train}")
    # print(f"accuracy_teacher_on_eval={accuracy_teacher_on_eval}, accuracy_student_on_eval={accuracy_student_on_eval}, pairwise_confidence_delta_on_eval={pairwise_confidence_delta_on_eval}")


    # log files - need to find the latest from the logs 
    # log_filenames = {train_loss_stg1, train_loss_stg2, eval_loss_on_train, eval_loss_on_eval}

    # Loss - parse the log for eval_loss, but careful different tasks have different loss
    # train_loss_stg1, train_loss_stg2, eval_loss_on_train, eval_loss_on_eval = get_loss(log_filenames)


    # return {
    #     "experiment_id": experiment_id,
    #     "accuracy_teacher_on_train": round(100*accuracy_teacher_on_train, 1), 
    #     "accuracy_student_on_train": round(100*accuracy_student_on_train, 1), 
    #     "pairwise_confidence_delta_on_train": round(pairwise_confidence_delta_on_train, 4),
    #     "accuracy_teacher_on_eval": round(100*accuracy_teacher_on_eval, 1), 
    #     "accuracy_student_on_eval": round(100*accuracy_student_on_eval, 1), 
    #     "pairwise_confidence_delta_on_eval": round(pairwise_confidence_delta_on_eval, 4),
    #     "teacher_ecc_eval_on_train": round(100*teacher_ecc_eval_on_train, 1),
    #     "teacher_ecc_eval_on_eval": round(100*teacher_ecc_eval_on_eval, 1),
    #     "student_ecc_eval_on_train": round(100*student_ecc_eval_on_train, 1),
    #     "student_ecc_eval_on_eval": round(100*student_ecc_eval_on_eval, 1)
    # }


    return {
        "exp_id": experiment_id,
        "acc_t_tr": round(100*accuracy_teacher_on_train, 1), 
        "acc_s_tr": round(100*accuracy_student_on_train, 1), 
        "pairwise_conf_delta_tr": round(pairwise_confidence_delta_on_train, 4),
        "acc_t_ev": round(100*accuracy_teacher_on_eval, 1), 
        "acc_s_ev": round(100*accuracy_student_on_eval, 1), 
        "pairwise_conf_delta_ev": round(pairwise_confidence_delta_on_eval, 4),
        "ecc_t_tr": round(100*teacher_ecc_eval_on_train, 1),
        "ecc_t_ev": round(100*teacher_ecc_eval_on_eval, 1),
        "ecc_s_tr": round(100*student_ecc_eval_on_train, 1),
        "ecc_s_ev": round(100*student_ecc_eval_on_eval, 1)
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--experiment",
                        default=None,
                        type=str,
                        required=True,
                        help="The input data dir. Should contain the experiment_id.")


    args = parser.parse_args()
    # print(args.experiment)
    metrics = get_metrics(args.experiment)
    # print(metrics)
    # exp_id,acc_t_tr,acc_s_tr,pairwise_conf_delta_tr,acc_t_ev,acc_s_ev,pairwise_conf_delta_ev,ecc_t_tr,ecc_t_ev,ecc_s_tr,ecc_s_ev
    # print(','.join(metrics.keys()))
    print(','.join(map(str, metrics.values())))
    
if __name__ == "__main__":
    main()

# TODO: measure STG1 as well
# TODO: simplify variable names