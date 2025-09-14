#[allow(unused_const)]
module suinotes::suinotes_data;
use std::string::String;


const TEXT: u8 = 0;
const ENCRYPTED_TEXT: u8 = 1;

public struct Data has store, drop {
    data_type: u8,
    value: String,
}

public fun create(data_type: u8, value: String): Data {
    let data = Data {
        data_type,
        value,
    };

    data
}

public fun create_notes(data_type: u8, value: String): Data {
    let data = Data {
        data_type,
        value,
    };

    data
}

public fun edit(data: &mut Data, content: String) {
    data.value = content;
}

public fun edit_notes(data: &mut Data, content: String) {
    data.value = content;
}

 public fun delete_note(data: &mut Data, content: String) {
    data.value = content;
 }