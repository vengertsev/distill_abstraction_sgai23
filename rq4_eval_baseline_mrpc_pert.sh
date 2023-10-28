# ==================== Train on extended data ============================
# run stage 2

#******************************************************************************
#
#									MRPC  train on traintest
#
#******************************************************************************

export BERT_BASE_DIR="./_models/bert-base-uncased-finetuned-mrpc"
export TASK_NAME="MRPC"
export GENERAL_TINYBERT_DIR="./_models/TinyBERT_General_6L_768D"
export MODEL_NAME="TinyBERT_6L_768D"
export TINYBERT_DIR_STG1="./models_train/${MODEL_NAME}_STG1/${TASK_NAME}"

export TASK_DIR="./_data/glue_data/${TASK_NAME}"
###T1 (intermediate layer distillation)
export TINYBERT_DIR_STG1="./models_train/${MODEL_NAME}_STG1_3ep/${TASK_NAME}"
export LOG="./logs/train_${TASK_NAME}_${MODEL_NAME}_stg1_3ep_$(date +%s).log"
#/opt/conda/envs/py37/bin/python ./TinyBERT/task_distill.py --teacher_model $BERT_BASE_DIR --student_model $GENERAL_TINYBERT_DIR --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $TINYBERT_DIR_STG1 --max_seq_length 128 --train_batch_size 32 --num_train_epochs 3 --do_lower_case  >$LOG
# --aug_train


###T2 (prediction layer distillation)
export TASK_DIR="./_data/glue_data/${TASK_NAME}"
export TINYBERT_DIR="./models_train/${MODEL_NAME}_3ep_stg1_2/${TASK_NAME}"
export LOG="./logs/train_${TASK_NAME}_${MODEL_NAME}_3ep_stg1_2_$(date +%s).log"
#/opt/conda/envs/py37/bin/python ./TinyBERT/task_distill.py --pred_distill --teacher_model $BERT_BASE_DIR --student_model $TINYBERT_DIR_STG1 --data_dir $TASK_DIR --task_name $TASK_NAME --output_dir $TINYBERT_DIR --do_lower_case --learning_rate 3e-5  --num_train_epochs  3 --eval_step 100 --max_seq_length 128 --train_batch_size 32 >$LOG
# --aug_train

#******************************************************************************
#
#									MRPC eval
#
#******************************************************************************

export TASK_NAME="MRPC"
export MODEL_NAME="bert-base-uncased-finetuned-mrpc"

export MODEL_DIR="./_models/bert-base-uncased-finetuned-mrpc"

## Eval model trained on extended data(on train)
export TASK_DIR="./_data/glue_data_train2dev/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train"
export LOG="./logs/eval_${TASK_NAME}_${MODEL_NAME}_on_train_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG


## Eval model trained on extended data (on eval)
export TASK_DIR="./_data/glue_data/${TASK_NAME}"
export OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval"
export LOG="./logs/eval_${TASK_NAME}_${MODEL_NAME}_on_eval_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval   --student_model $MODEL_DIR   --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG


