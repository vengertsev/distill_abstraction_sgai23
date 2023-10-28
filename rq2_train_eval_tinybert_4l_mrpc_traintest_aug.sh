# ==================== Train on extended data ============================
# run stage 2

#******************************************************************************
#
#									MRPC train on traintest
#
#******************************************************************************
# Augumentation
export BERT_BASE_DIR="./_models/bert-base-uncased-finetuned-mrpc"
export TASK_NAME="MRPC"
export TASK_DIR="./_data/glue_data_traintest/"
export GLOVE_EMB="./_data/glove/glove.6B.300d.txt"
python ./TinyBERT/data_augmentation.py --pretrained_bert_model  $BERT_BASE_DIR   --glove_embs $GLOVE_EMB   --glue_dir $TASK_DIR  --task_name $TASK_NAME

export TASK_DIR="./_data/glue_data_traintest/${TASK_NAME}"
export GENERAL_TINYBERT_DIR="./_models/TinyBERT_General_6L_768D"
export MODEL_NAME="TinyBERT_4L_312D"
export TINYBERT_DIR_STG1="./models_train/${MODEL_NAME}_STG1_aug/${TASK_NAME}"


###T1 (intermediate layer distillation)
export TINYBERT_DIR_STG1="./models_train/${MODEL_NAME}_STG1_traintest_3ep_aug/${TASK_NAME}"
export LOG="./logs/train_${TASK_NAME}_${MODEL_NAME}_stg1_traintest_3ep_$(date +%s).log"
python ./TinyBERT/task_distill.py --teacher_model $BERT_BASE_DIR --student_model $GENERAL_TINYBERT_DIR --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $TINYBERT_DIR_STG1 --max_seq_length 128 --train_batch_size 32 --num_train_epochs 3 --do_lower_case --aug_train >$LOG


###T2 (prediction layer distillation)
# glue_data_traintest - contains both test and train datasets
export TASK_DIR="./_data/glue_data_traintest/${TASK_NAME}"
export TINYBERT_DIR="./models_train/${MODEL_NAME}_traintest_3ep_stg1_2_aug/${TASK_NAME}"
export LOG="./logs/train_${TASK_NAME}_${MODEL_NAME}_traintest_3ep_stg1_2_$(date +%s).log"
python ./TinyBERT/task_distill.py --pred_distill --teacher_model $BERT_BASE_DIR --student_model $TINYBERT_DIR_STG1 --data_dir $TASK_DIR --task_name $TASK_NAME --output_dir $TINYBERT_DIR --do_lower_case --learning_rate 3e-5  --num_train_epochs  3 --eval_step 100 --max_seq_length 128 --train_batch_size 32 --aug_train >$LOG


#******************************************************************************
#
#									MRPC eval
#
#******************************************************************************

export TASK_NAME="MRPC"
export MODEL_NAME="TinyBERT_4L_312D_traintest_3ep_stg1_2_aug"

export MODEL_DIR="./models_train/${MODEL_NAME}/${TASK_NAME}"

## Eval model trained on extended data(on train)
export TASK_DIR="./_data/glue_data_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train"
export LOG="./logs/eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG


## Eval model trained on extended data (on eval)
export TASK_DIR="./_data/glue_data/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval"
export LOG="./logs/eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG


