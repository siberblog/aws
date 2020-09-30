#! /bin/bash

clear

function yasi_yaz(){
	local dogum_yili
	read -p "Dogum yili giriniz: " dogum_yili

	let yas=$1-$dogum_yili
	echo $yas
}


yasi_yaz 2020

