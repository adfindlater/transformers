# For now, we are using this run script to pass arguments
# to the python training script.  We need to set
# the first two variables below for each run:

export CURRENT_DIR=$(pwd)
# output directory
export OUTPUT_DIR_NAME=DEV_ka_timeordered_out
# export OUTPUT_DIR_NAME=lob_CoverageType_001
# directory containing train.csv and eval.csv
# export DATA_DIR=$CURRENT_DIR/data/lob_coverageType
export DATA_DIR=$CURRENT_DIR/data/DEV_ka_timeordered

export MAX_LENGTH=64
export LEARNING_RATE=2e-5
export NUM_EPOCHS=1
export SEED=2
export BERT_MODEL=bert-base-uncased
export OUTPUT_DIR=${CURRENT_DIR}/${OUTPUT_DIR_NAME}
export TASK_NAME=mnli

mkdir -p $OUTPUT_DIR
export PYTHONPATH="../":"${PYTHONPATH}"

python3 run_bert_textClassifier.py --data_dir $DATA_DIR \
--model_name_or_path $BERT_MODEL \
--output_dir $OUTPUT_DIR \
--task_name $TASK_NAME \
--do_train \
--do_eval \
--max_seq_length  $MAX_LENGTH \
--learning_rate $LEARNING_RATE \
--num_train_epochs $NUM_EPOCHS \
--seed $SEED \
--per_device_train_batch_size=5 \
--per_device_eval_batch_size=5 \
--logging_steps=50 \
--evaluation_strategy='steps' \
--eval_steps=1000
