#!/bin/bash

# цільова директорія - "." - поточна директорія
target_dir="."

# проходжусь по всьому вмісту цільової (у моєму випадку, поточної) директорії
for item in "$target_dir"/*; do
    
# перевірка - чи є об'єкт директорією
    if [ -d "$item" ]; then
        echo "$(basename "$item") є директорією" 
# перевірка - чи є об'єкт файлом
    elif [ -f "$item" ]; then
        filename=$(basename "$item")
        dir_name="${filename}_dir"
        
# створюю нову директорію для файлу
        mkdir -p "$target_dir/$dir_name"
        
# переміщую файл до нової директорії
        mv "$item" "$target_dir/$dir_name/"
        
# виводжу інформацію, що filename переміщений dir_name
        echo "$filename переміщений в $dir_name"
    fi
done

