alter table agency modify intake_indepth_state char(3) NOT NULL;
alter table agency modify intake_quick_state char(3) NOT NULL;

update agency set intake_indepth_state='HSC';
update agency set intake_quick_state='HSC';
