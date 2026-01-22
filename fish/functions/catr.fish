function catr --description 'Recursively cat files with headers'
    set target (count $argv) -gt 0; and set target $argv; or set target .
    
    find $target -type f \
                -exec printf "\n===== %s =====\n" {} \; \
                -exec cat {} \;
end
