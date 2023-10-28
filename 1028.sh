#  Train 
export EXPERIMENT_ID="1028"
export BERT_BASE_DIR="./_models/bert-base-uncased-finetuned-mrpc"
export TASK_NAME="MRPC"

export MODEL_NAME="TinyBERT_6L_768D"
export GENERAL_TINYBERT_DIR="./_models/TinyBERT_General_6L_768D"

# Augumentation
# export TASK_DIR="./_data/glue_data/"
# export GLOVE_EMB="./_data/glove/glove.6B.300d.txt"
#python ./TinyBERT/data_augmentation.py --pretrained_bert_model  $BERT_BASE_DIR   --glove_embs $GLOVE_EMB   --glue_dir $TASK_DIR  --task_name $TASK_NAME

export TASK_DIR="./_data/glue_data/${TASK_NAME}"

## Train STG1
echo "*********** Train STG1 ***********"
export MODEL_STG1_DIR="./models_train/${MODEL_NAME}_${EXPERIMENT_ID}_stg1_${TASK_NAME}"
export LOG="./logs/train_${EXPERIMENT_ID}_stg1_$(date +%s).log"
python ./TinyBERT/task_distill.py --teacher_model $BERT_BASE_DIR --student_model $GENERAL_TINYBERT_DIR --data_dir $TASK_DIR  --task_name $TASK_NAME --output_dir $MODEL_STG1_DIR --max_seq_length 128 --train_batch_size 32 --num_train_epochs 3 --do_lower_case --aug_train >$LOG

## Train STG2 
echo "*********** Train STG2 ***********"
export TASK_DIR="./_data/glue_data/${TASK_NAME}"
export MODEL_STG2_DIR="./models_train/${MODEL_NAME}_${EXPERIMENT_ID}_stg2_${TASK_NAME}"
export LOG="./logs/train_${EXPERIMENT_ID}_stg2_$(date +%s).log"
python ./TinyBERT/task_distill.py --pred_distill --teacher_model $BERT_BASE_DIR --student_model $MODEL_STG1_DIR --data_dir $TASK_DIR --task_name $TASK_NAME --output_dir $MODEL_STG2_DIR --do_lower_case --learning_rate 3e-5  --num_train_epochs  10 --eval_step 2000 --max_seq_length 128 --train_batch_size 32 --aug_train >$LOG


#  Eval 
## on train
echo "*********** Eval on train ***********"
export EVAL_ON_TRAIN_DIR="./_data/glue_data_train2dev/${TASK_NAME}"
export EVAL_ON_TRAIN_OUTPUT_DIR="./eval_results/${EXPERIMENT_ID}_on_train"
export LOG="./logs/eval_${EXPERIMENT_ID}_on_train_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval   --student_model $MODEL_STG2_DIR   --data_dir $EVAL_ON_TRAIN_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_TRAIN_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG

## on eval
echo "*********** Eval on eval ***********"
export EVAL_ON_EVAL_DIR="./_data/glue_data/${TASK_NAME}"
export EVAL_ON_EVAL_OUTPUT_DIR="./eval_results/${EXPERIMENT_ID}_on_eval"
export LOG="./logs/eval_${EXPERIMENT_ID}_on_eval_$(date +%s).log"
python ./TinyBERT/task_distill.py --do_eval    --student_model $MODEL_STG2_DIR   --data_dir $EVAL_ON_EVAL_DIR  --task_name $TASK_NAME --output_dir $EVAL_ON_EVAL_OUTPUT_DIR  --do_lower_case  --eval_batch_size 32 --max_seq_length 128  > $LOG


