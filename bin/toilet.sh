for f in /usr/share/figlet/* 
do 
  fs=$(basename $f)
  fname=${fs%%.tlf}
	echo $fname
  toilet -f $fname --filter gay "Human
Sensing"
done
