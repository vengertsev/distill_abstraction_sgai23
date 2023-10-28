#!/bin/bash

#export EXPERIMENT_ID="1008"

# python ./TinyBERT/metrics.py --experiment $EXPERIMENT_ID

# TODO: where to save the metrics

echo "exp_id,acc_t_tr,acc_s_tr,pairwise_conf_delta_tr,acc_t_ev,acc_s_ev,pairwise_conf_delta_ev,ecc_t_tr,ecc_t_ev,ecc_s_tr,ecc_s_ev"

# RTE
# python ./TinyBERT/metrics.py --experiment "1006"
# python ./TinyBERT/metrics.py --experiment "1011"
# python ./TinyBERT/metrics.py --experiment "1012"

# python ./TinyBERT/metrics.py --experiment "1013"
# python ./TinyBERT/metrics.py --experiment "1014"
# python ./TinyBERT/metrics.py --experiment "1015"

# python ./TinyBERT/metrics.py --experiment "1018"
# python ./TinyBERT/metrics.py --experiment "1019"


python ./TinyBERT/metrics.py --experiment "1007"
python ./TinyBERT/metrics.py --experiment "1009"
python ./TinyBERT/metrics.py --experiment "1010"






# python ./TinyBERT/metrics.py --experiment "1113"


# MRPC
# python ./TinyBERT/metrics.py --experiment "1008"
# python ./TinyBERT/metrics.py --experiment "1016"
# python ./TinyBERT/metrics.py --experiment "1017"


# echo ${$BASH_ARGV/.sh/} # https://stackoverflow.com/questions/14835193/how-do-i-get-the-script-name-being-executed-in-bash