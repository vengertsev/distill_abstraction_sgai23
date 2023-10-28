export MODEL_NAME="bert-base-uncased-rte"
export TASK_NAME="RTE"

export BERT_BASE_DIR="./_models/${MODEL_NAME}"
## on train
export EVAL_ON_TRAIN_DIR="./_data/glue_data_train2dev/${TASK_NAME}"
export EVAL_ON_TRAIN_OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train"
export LOG="./logs/eval_${MODEL_NAME}_on_train_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval   --student_model $BERT_BASE_DIR   --data_dir $EVAL_ON_TRAIN_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_TRAIN_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## on eval
export EVAL_ON_EVAL_DIR="./_data/glue_data/${TASK_NAME}"
export EVAL_ON_EVAL_OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval"
export LOG="./logs/eval_${MODEL_NAME}_on_eval_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $BERT_BASE_DIR   --data_dir $EVAL_ON_EVAL_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_EVAL_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG


# -------------------------------------------------------------
export MODEL_NAME="bert-base-uncased-finetuned-mrpc"
export TASK_NAME="MRPC"

export BERT_BASE_DIR="./_models/${MODEL_NAME}"
## on train
export EVAL_ON_TRAIN_DIR="./_data/glue_data_train2dev/${TASK_NAME}"
export EVAL_ON_TRAIN_OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train"
export LOG="./logs/eval_${MODEL_NAME}_on_train_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval   --student_model $BERT_BASE_DIR   --data_dir $EVAL_ON_TRAIN_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_TRAIN_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## on eval
export EVAL_ON_EVAL_DIR="./_data/glue_data/${TASK_NAME}"
export EVAL_ON_EVAL_OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval"
export LOG="./logs/eval_${MODEL_NAME}_on_eval_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $BERT_BASE_DIR   --data_dir $EVAL_ON_EVAL_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_EVAL_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

# -------------------------------------------------------------
export MODEL_NAME="bert-base-uncased-finetuned-sst2"
export TASK_NAME="SST-2"

export BERT_BASE_DIR="./_models/${MODEL_NAME}"
## on train
export EVAL_ON_TRAIN_DIR="./_data/glue_data_train2dev/${TASK_NAME}"
export EVAL_ON_TRAIN_OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train"
export LOG="./logs/eval_${MODEL_NAME}_on_train_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval   --student_model $BERT_BASE_DIR   --data_dir $EVAL_ON_TRAIN_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_TRAIN_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## on eval
export EVAL_ON_EVAL_DIR="./_data/glue_data/${TASK_NAME}"
export EVAL_ON_EVAL_OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval"
export LOG="./logs/eval_${MODEL_NAME}_on_eval_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $BERT_BASE_DIR   --data_dir $EVAL_ON_EVAL_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_EVAL_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG


# -------------------------------------------------------------
export MODEL_NAME="bert-base-uncased-QNLI"
export TASK_NAME="QNLI"

export BERT_BASE_DIR="./_models/${MODEL_NAME}"
## on train
export EVAL_ON_TRAIN_DIR="./_data/glue_data_train2dev/${TASK_NAME}"
export EVAL_ON_TRAIN_OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train"
export LOG="./logs/eval_${MODEL_NAME}_on_train_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval   --student_model $BERT_BASE_DIR   --data_dir $EVAL_ON_TRAIN_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_TRAIN_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## on eval
export EVAL_ON_EVAL_DIR="./_data/glue_data/${TASK_NAME}"
export EVAL_ON_EVAL_OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval"
export LOG="./logs/eval_${MODEL_NAME}_on_eval_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $BERT_BASE_DIR   --data_dir $EVAL_ON_EVAL_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_EVAL_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG


# -------------------------------------------------------------
export MODEL_NAME="bert-base-uncased-QQP"
export TASK_NAME="QQP"

export BERT_BASE_DIR="./_models/${MODEL_NAME}"
## on train
export EVAL_ON_TRAIN_DIR="./_data/glue_data_train2dev/${TASK_NAME}"
export EVAL_ON_TRAIN_OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_train"
export LOG="./logs/eval_${MODEL_NAME}_on_train_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval   --student_model $BERT_BASE_DIR   --data_dir $EVAL_ON_TRAIN_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_TRAIN_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG
## on eval
export EVAL_ON_EVAL_DIR="./_data/glue_data/${TASK_NAME}"
export EVAL_ON_EVAL_OUTPUT_DIR="./eval_results/${MODEL_NAME}/${TASK_NAME}_on_eval"
export LOG="./logs/eval_${MODEL_NAME}_on_eval_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $BERT_BASE_DIR   --data_dir $EVAL_ON_EVAL_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_EVAL_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

