PRAGMA foreign_keys = ON;

create table users (

    id integer primary key,
    fname text not null, 
    lname text not null  

);

create table questions (

    id integer primary key,
    title text not null, 
    body text not null, 
    associated_author text not null,

    foreign key (associated_author) references users(id)
);


create table questions_follows (
    id integer primary key ,

    question_id integer,
    user_id integer ,

    foreign key (question_id) references questions(id),
    foreign key (user_id) references users(id)
);

create table replies (
    id integer primary key,

    subject_question integer not null ,
    user integer not null ,
    parent_reply integer ,
    body text not null ,

    foreign key (subject_question) references questions(id),
    foreign key (user) references users(id),
    foreign key (parent_reply) references replies(id)

);

create table questions_likes (
    id integer primary key,
    question_id integer not null,
    user_id integer not null,

    foreign key (question_id) references questions(id),
    foreign key (user_id) references users(id)

);


insert into 
     users(fname, lname)
values 
    ('Ricardo Dejuan', 'Almaraz Tito');



insert into 
    questions(title, body, associated_author)
values 
    ('sitting','do we actually sit?', 
    (SELECT id FROM users WHERE fname = 'Ricardo Dejuan' AND lname = 'Almaraz Tito' )
    );




