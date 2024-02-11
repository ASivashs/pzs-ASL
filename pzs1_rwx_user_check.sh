#!/bin/bash


# 14
# Для каждого из созданных файлов проверить, можно ли прочитать,
# редактировать, запустить файл пользователям:
# iit11, iit12, iit21, iit22, iit3, root.
cd pzs
for dir in pzs11 pzs12 pzs13 pzs14; do
  cd $dir
  for file in file*; do
    echo "Checking permissions for $dir/$file"
    for user in iit11 iit12 iit21 iit22 iit3 root; do
      echo "User $user:"

      # Read
      su $user -c "cat $file" 2>/dev/null
      if [ $? -eq 0 ]; then
        echo "Can read $dir/$file"
      else
        echo "Cannot read $dir/$file"
      fi

      # Write
      su $user -c "echo \"test\" >> $file" 2>/dev/null
      if [ $? -eq 0 ]; then
        echo "Can write to $dir/$file"
      else
        echo "Cannot write to $dir/$file"
      fi

      # Eexecute
      su $user -c "bash $file" 2>/dev/null
      if [ $? -eq 0 ]; then
        echo "Can execute $dir/$file"
      else
        echo "Cannot execute $dir/$file"
      fi

    done
    echo "-----------------"
  done
  cd ..
  echo "+++++++++++++++++"
done
