create table if not exists  oauth_client_details (
  client_id varchar(255) not null primary key,
  client_secret varchar(255) not null,
  web_server_redirect_uri varchar(2048) default null,
  scope varchar(255) default null,
  access_token_validity int default null,
  refresh_token_validity int default null,
  resource_ids varchar(1024) default null,
  authorized_grant_types varchar(1024) default null,
  authorities varchar(1024) default null,
  additional_information varchar(4096) default null,
  autoapprove varchar(255) default null

);
create table if not exists  permission (
  id serial primary key,
  name varchar(512) default null unique
);

create table if not exists role (
  id serial primary key,
  name varchar(255) default null unique
) ;
create table if not exists  users (
  id serial primary key,
  username varchar(100) not null unique,
  password varchar(1024) not null,
  email varchar(1024) not null,
  enabled smallint not null,
  accountNonExpired smallint not null,
  credentialsNonExpired smallint not null,
  accountNonLocked smallint not null
) ;
create table  if not exists permission_role (
  permission_id  int default null REFERENCES permission(id),
  role_id int default null references role (id)
)  ;
create table if not exists role_user (
  role_id int default null references role (id),
  user_id int default null references users (id)
);

create table if not exists oauth_client_token (
  token_id VARCHAR(256),
  token BYTEA,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);


create table if not exists oauth_access_token (
  token_id VARCHAR(256),
  token BYTEA,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication BYTEA,
  refresh_token VARCHAR(256)
);

create table if not exists oauth_refresh_token (
  token_id VARCHAR(256),
  token BYTEA ,
  authentication BYTEA
);

create table if not exists oauth_code (
  code VARCHAR(256), authentication BYTEA
);
create table if not exists oauth_approvals (
  userId VARCHAR(256),
  clientId VARCHAR(256),
  scope VARCHAR(256),
  status VARCHAR(10),
  expiresAt TIMESTAMP,
  lastModifiedAt TIMESTAMP
);
