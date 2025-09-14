
/// Module: notes
module suinotes::suinotes_v2;
use std::string::String;
use sui::clock::Clock;
use suinotes::suinotes_data::{Self as df, Data};

public struct Note has key, store {
    id: UID,
    title: String,
    content: Data,
    timestamp: u64,
}

public fun create_notes(title: String, data: String, clock: &Clock, ctx: &mut TxContext): Note {
    let data = df::create(0, data);

    let note = Note {
        id: object::new(ctx),
        title,
        content: data,
        timestamp: clock.timestamp_ms(),
    };

    note
}


public fun create_notes_v2(title: String, data: String, clock: &Clock, ctx: &mut TxContext): Note {
    let data = df::create_notes(0, data);

    let note = Note {
        id: object::new(ctx),
        title,
        content: data,
        timestamp: clock.timestamp_ms(),
    };

    note
}

public fun edit_notes(note: &mut Note, content: String) {
    note.content.edit(content);
}

public fun edit_notes_v2(note: &mut Note, content: String) {
    note.content.edit(content);
}

 public fun delete_note(note: Note) {
     let Note { id, .. } = note;
    id.delete();
 }