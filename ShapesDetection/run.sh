#!/bin/bash
W=50
H=50
NUM_POS=1000
NUM_NEG=1000

rm ${PWD}/train/out/params.xml

# STEP 1: Fill negative samples locations file
find ${PWD}/train/negatives/img -name '*.jpg' -exec echo \{\} \; > bg.txt

# STEP 2: Positive samples generation
## Either use your hown positive pictures
### Create ".dat"
#find ../positives/img -name '*.jpg' -exec echo \{\} 1 0 0 ${W} ${H} \; > ../positives/positives.dat
### Create ".vec" from ".dat"
#opencv_createsamples -info ../positives/positives.dat -vec ./samples_output.vec -w ${W} -h ${H}
### Create ".vec" from ".jpg
#opencv_createsamples -img ../positives/img/*.jpg -info ./annotations.lst -bg ./bg.txt -jpgoutput -maxxangle 0.1 -maxyangle 0.1 -maxzangle 0.1 -num ${NUM_POS} -w ${W} -h ${H} -show #opencv_createsamples -vec ./samples_output.vec -w echo ${W} -h echo ${H}
## Or automatically create positive pictures
opencv_createsamples -img ${PWD}/train/positives/img/*.jpg -info annotations.lst -vec ${PWD}/train/positives/samples_output.vec -bg bg.txt -maxxangle 0.1 -maxyangle 0.1 -maxzangle 0.1 -num ${NUM_POS} -w ${W} -h ${H} && opencv_createsamples -vec ${PWD}/train/positives/samples_output.vec -w ${W} -h ${H}

# STEP 3: Train
opencv_traincascade -data ${PWD}/train/out -vec ${PWD}/train/positives/samples_output.vec -bg ${PWD}/train/negatives/bg.txt -numStages 20 -minHitRate 0.999 -maxFalseAlarmRate 0.5 -acceptanceRatioBreakValue 0.0001 -numPos ${NUM_POS} -numNeg ${NUM_NEG} -w ${W} -h ${H} -mode ALL -precalcValBufSize 1024 -precalcIdxBufSize 1024

# STEP 4: Execute on image
python ./main.py ./test.jpg
