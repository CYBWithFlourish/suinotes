#[allow(unused_const)]
module suinotes::suinotes_data;
use std::string::String;


const TEXT: u8 = 0;
const ENCRYPTED_TEXT: u8 = 1;

public struct Data has store {
    data_type: u8,
    value: String,
}


public fun create_notes(data_type: u8, value: String): Data {
    let data = Data {
        data_type,
        value,
    };

    data
}

public fun edit_notes(data: &mut Data, content: String) {
    data.value = content;
}