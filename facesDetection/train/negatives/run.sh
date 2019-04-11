#!/bin/bash
W=40
H=50
NUM_POS=72
NUM_NEG=100

# Positive samples generation
#rmdir ../out
#rm ../out/params.xml
#rm samples_output.vec
#mkdir ../out

# Either use your hown positive pictures
## Create ".dat"
#find ./img -name '*.jpg' -exec echo \{\} 1 0 0 40 50 \; > samplesdescription.dat
## Create ".vec" from ".dat"
#opencv_createsamples -info ../positives/positives.dat -vec ./samples_output.vec -w ${W} -h ${H}

# Or automatically create positive pictures
#opencv_createsamples -img ../positives/img/*.jpg -info ./annotations.lst -vec ./samples_output.vec -bg ./bg.txt -maxxangle 0.1 -maxyangle 0.1 -maxzangle 0.1 -num 100 -w ${W} -h ${H}
#&& opencv_createsamples -vec ./samples_output.vec -w echo ${W} -h echo ${H}

# Train
#opencv_traincascade -data ../out -vec samples_output.vec -bg bg.txt -numStages 20 -minHitRate 0.999 -maxFalseAlarmRate 0.5 -numPos ${NUM_POS} -numNeg ${NUM_NEG} -w ${W} -h ${H} -mode ALL -precalcValBufSize 1024 -precalcIdxBufSize 1024

# Execute on image
cd ../.. && python ./main.py
