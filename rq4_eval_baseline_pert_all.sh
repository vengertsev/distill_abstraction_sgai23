export RQ="rq4"

#export TASK_NAME="SST-2"
## ====== Baseline eval
#export MODEL_NAME="bert-base-uncased-finetuned-sst2"
#export MODEL_DIR="./_models/${MODEL_NAME}"
### Eval (on train)
#export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
#export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
#export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
#python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
### Eval (on eval)
#export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
#export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
#export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
#python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
#
## ====== 6L eval
#export MODEL_NAME="TinyBERT_6L_768D"
#export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"
### Eval (on train)
#export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
#export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
#export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
#python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
### Eval (on eval)
#export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
#export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
#export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
#python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
#
## ====== 4L eval
#export MODEL_NAME="TinyBERT_4L_312D"
#export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"
### Eval (on train)
#export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
#export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
#export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
#python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
### Eval (on eval)
#export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
#export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
#export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
#python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG


export TASK_NAME="RTE"
# ====== Baseline eval
export MODEL_NAME="bert-base-uncased-rte"
export MODEL_DIR="./_models/${MODEL_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

# ====== 6L eval
export MODEL_NAME="TinyBERT_6L_768D"
export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

# ====== 4L eval
export MODEL_NAME="TinyBERT_4L_312D"
export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG




export TASK_NAME="MRPC"
# ====== Baseline eval
export MODEL_NAME="bert-base-uncased-finetuned-mrpc"
export MODEL_DIR="./_models/${MODEL_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

# ====== 6L eval
export MODEL_NAME="TinyBERT_6L_768D"
export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

# ====== 4L eval
export MODEL_NAME="TinyBERT_4L_312D"
export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG



export TASK_NAME="QQP"
# ====== Baseline eval
export MODEL_NAME="bert-base-uncased-QQP"
export MODEL_DIR="./_models/${MODEL_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

# ====== 6L eval
export MODEL_NAME="TinyBERT_6L_768D"
export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

# ====== 4L eval
export MODEL_NAME="TinyBERT_4L_312D"
export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

export TASK_NAME="QNLI"
# ====== Baseline eval
export MODEL_NAME="bert-base-uncased-QNLI"
export MODEL_DIR="./_models/${MODEL_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

# ====== 6L eval
export MODEL_NAME="TinyBERT_6L_768D"
export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

# ====== 4L eval
export MODEL_NAME="TinyBERT_4L_312D"
export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"
## Eval (on train)
export TASK_DIR="./_data/glue_data_perturbed_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## Eval (on eval)
export TASK_DIR="./_data/glue_data_perturbed/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval_pert"
export LOG="./logs/${RQ}_eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s)_pert.log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
