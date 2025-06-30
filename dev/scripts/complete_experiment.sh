#!/bin/bash
# write a bash script to run the Draco encoder with different values of qp and cl
# for qp from 0 to 30 and cl from 0 to 10
# run ./draco_encoder -i ../../datasets/point_cloud_PLY_39574292_1080_26-09-2024-10-52-12.ply -o ../../results/out_$qp_$cl.drc -qp qp -cl cl
# get the duration of the encoding from output on console the output is like "STUFF (xxx ms to encode)     STUFF" take the part after "(" and before " ms" and save the duration in a bash variable called encoding_time
# get original size in bytes of the input file ../../datasets/point_cloud_PLY_39574292_1080_26-09-2024-10-52-12.ply and save it in a bash variable called original_size
# get file to compress by $1

file_to_compress=$1

file_name=$(basename $file_to_compress)

# create folder for resuls if it does not exist
mkdir -p ../../results/${file_name}
# delete benchmark file if it exists
rm -f ../../results/${file_name}/benchmark_encoding.csv
# create header for benchmark file "qp, cl, encoding_time(ms), original_size(bytes), encoded_size(bytes)"
echo "qp, cl, encoding_time(ms), original_size(bytes), encoded_size(bytes), decoding_time(ms)" >> "../../results/${file_name}/benchmark_encoding.csv"

for qp in {0..30}
do
    for cl in {0..10}
    do
        output_file="../../results/${file_name}/out_${qp}_${cl}.drc"
        encoding_time=$(./draco_encoder -i $file_to_compress -o $output_file -qp $qp -cl $cl | grep -oP '\(\K[^\ ms]+')
        original_size=$(stat -c %s $file_to_compress)
        encoded_size=$(stat -c %s $output_file)
        decoding_time=$(./draco_decoder -i $output_file -o $output_file.decoded.ply | grep -oP '\(\K[^\ ms]+')
        echo "qp: $qp, cl: $cl, encoding time: $encoding_time, original size: $original_size, encoded size: $encoded_size, decoding time: $decoding_time"
        echo "$qp, $cl, $encoding_time, $original_size, $encoded_size, $decoding_time" >> "../../results/${file_name}/benchmark_encoding.csv"
    done
done
