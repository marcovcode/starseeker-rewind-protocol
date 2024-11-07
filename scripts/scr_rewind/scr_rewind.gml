function rewind(to_rewind) {
    steps_size = ds_list_size(steps_data)

    if o_rewind.is_rewinding {
        rewind_time--

        if steps_size + rewind_time > 0 {
            arr = steps_data[| steps_size + rewind_time]
			
            if is_array(arr) {
                array_copy(to_rewind, 0, arr, 0, array_length(arr))
            }
        } else {
            arr = steps_data[| 0]

            if is_array(arr) {
                array_copy(to_rewind, 0, arr, 0, array_length(arr))
            }
        }
    } else if not o_rewind.is_rewinding {
        rewind_time = 0

        copy_arr = array_create(array_length(to_rewind))
        array_copy(copy_arr, 0, to_rewind, 0, array_length(to_rewind))

        ds_list_add(steps_data, copy_arr)
    }
}