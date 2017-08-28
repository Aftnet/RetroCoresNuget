platforms=(desktop_x86 desktop_x64 uwp_x86 uwp_x64 uwp_arm)
artifacts=(*.dll *.lib *.pdb *.exp *.manifest)
destFolder=./artifacts

rm -r $destFolder
mkdir $destFolder

for i in "${platforms[@]}"
do
    make clean && make -f makefile.libretro platform=windows_msvc2017_$i
    
    mkdir $destFolder/$i
    for j in "${artifacts[@]}"
    do
    mv ./$j $destFolder/$i
    done
done