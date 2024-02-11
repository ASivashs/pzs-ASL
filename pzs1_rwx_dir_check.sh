#!/bin/bash


# 16
# В каждой из созданных папок проверить, можно ли прочитать содержимое
# папок, создать новые файлы, удалить каждый из существующих файлов
for dir in pzs11 pzs12 pzs13 pzs14 pzs15; do
  cd $dir
  for user in iit11 iit12 iit21 iit22 iit3 root; do
    echo "User $user:"
    # Проверить, можно ли прочитать содержимое папки
    su $user -c "ls" 2>/dev/null
    if [ $? -eq 0 ]; then
      echo "Can read $dir"
    else
      echo "Cannot read $dir"
    fi
    # Проверить, можно ли создать новый файл в папке
    su $user -c "touch test" 2>/dev/null
    if [ $? -eq 0 ]; then
      echo "Can create new file in $dir"
      # Удалить созданный файл
      rm test
    else
      echo "Cannot create new file in $dir"
    fi
    # Проверить, можно ли удалить каждый из существующих файлов
    for file in file*; do
      su $user -c "rm $file" 2>/dev/null
      if [ $? -eq 0 ]; then
        echo "Can delete $file"
      else
        echo "Cannot delete $file"
      fi
    done
    echo "-----------------"
  done
  cd ..
done
