#!/bin/bash


# 15
# Запустить каждый из файлов, которые удовлетворяют шаблону «filex5»
# пользователем iit11. Проверить, можно ли остановить запущенный процесс
# пользователям: iit11, iit12, iit21, iit22, iit3, root.
cd pzs
for dir in pzs11 pzs12 pzs13 pzs14; do
  cd $dir
  for file in file*5; do
    echo "Running $file at iit11"
    su iit11 -c "bash $file &" 2>/dev/null
    echo "PID: $!"
    pid=$!
    for user in iit11 iit12 iit21 iit22 iit3 root; do
      echo "User $user:"
      su $user -c "kill $pid" 2>/dev/null
      if [ $? -eq 0 ]; then
        echo "Can kill $dir/$file"
      else
        echo "Cannot kill $dir/$file"
      fi
    done
    echo "-----------------"
  done
  cd ..
  echo "+++++++++++++++++"
done
