#!/bin/bash


res1=$(date +%s.%N)



. ./env_setup.sh ${1} || exit 1;



read -t 10 -p "Clean up?-(y/n)--10sec timeout >" mc;
if [ "$mc" = "Y" -o "$mc" = "y"  ]; then
. ./clean.sh
fi


echo "${bldcya}***** Compiling kernel *****${txtrst}"
mkdir output
make -C $(pwd) O=output VARIANT_DEFCONFIG=apq8084_sec_trlte_eur_defconfig apq8084_sec_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -j$( nproc --all ) -C $(pwd) O=output


	cp output/arch/arm/boot/zImage ./AnyKernel3/zImage
	./tools/dtbTool -o ./AnyKernel3/dtb -s 4096 -p ./output/scripts/dtc/ ./output/arch/arm/boot/dts/
	stat ./AnyKernel3/zImage || exit 1



	echo "${bldcya} --- Finalizing ---${txtrst}"
	for i in $(find "output" -name '*.ko'); do
	         cp -av "$i" ./AnyKernel3/modules/system/lib/modules;
done;
sleep 2;

	cd AnyKernel3
		zip -r9 UPDATE-Flashpoint-`date +"%m-%d"`.zip * -x .git README.md *.zip *placeholder	
	echo "${bldgrn}***** Complete! Find zip in AnyKernel3/ *****${txtrst}"
	res2=$(date +%s.%N)
	echo "${bldgrn}Total time elapsed: ${txtrst}${bldgrn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
exit 0;

done
