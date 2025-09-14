
/// Module: notes
module suinotes::suinotes_v3;
use std::string::String;
use sui::clock::Clock;
use suinotes::suinotes_data::{Self as df, Data};

public struct Note has key, store {
    id: UID,
    title: String,
    content: Data,
    timestamp: u64,
    owner: address,
}

public fun create_notes(title: String, data: String, clock: &Clock, ctx: &mut TxContext): Note {
    let data = df::create_notes(0, data);

    let note = Note {
        id: object::new(ctx),
        title,
        content: data,
        timestamp: clock.timestamp_ms(),
        owner: ctx.sender(),
    };

    note
}


public fun create_notes_v2(title: String, data: String, clock: &Clock, ctx: &mut TxContext): Note {
    let data = df::create(0, data);

    let note = Note {
        id: object::new(ctx),
        title,
        content: data,
        timestamp: clock.timestamp_ms(),
        owner: ctx.sender(),
    };

    note
}

public fun edit_notes(note: &mut Note, content: String) {
    note.content.edit(content);
}

public fun edit_notes_2(note: &mut Note, content: String) {
    note.content.edit_notes(content);
}

public fun seal_approve_notes(note: &Note, ctx: &mut TxContext): bool {
    if (note.owner == ctx.sender()) { true } else { false }
}

public fun delete_notes(note: Note) {
     let Note { id, .. } = note;
     id.delete();
}