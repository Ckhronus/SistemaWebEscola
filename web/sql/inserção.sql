insert into usuario(nome, email, senha, tipo) values("Joao", "joao@joao", AES_ENCRYPT("321", "PSINAEBEOB39URMCN75830XMK0"),2);
insert into usuario(nome, email, senha, tipo) values("Carla", "Carla@Carla", AES_ENCRYPT("132", "PSINAEBEOB39URMCN75830XMK0"),4);
insert into usuario(nome, email, senha, tipo) values("Gusmão", "Gusmão@Gusmão", AES_ENCRYPT("4132", "PSINAEBEOB39URMCN75830XMK0"),2);
insert into usuario(nome, email, senha, tipo) values("Ricardo", "Ricardo@Ricardo", AES_ENCRYPT("1423", "PSINAEBEOB39URMCN75830XMK0"),4);
insert into usuario(nome, email, senha, tipo) values("Ana", "Ana@Ana", AES_ENCRYPT("15233", "PSINAEBEOB39URMCN75830XMK0"),2);
insert into usuario(nome, email, senha, tipo) values("Flavia", "Flavia@Flavia", AES_ENCRYPT("4123", "PSINAEBEOB39URMCN75830XMK0"),4);
insert into usuario(nome, email, senha, tipo) values("Pedro", "Pedro@Pedro", AES_ENCRYPT("51423", "PSINAEBEOB39URMCN75830XMK0"),3);
insert into usuario(nome, email, senha, tipo) values("Augusto", "Augusto@Augusto", AES_ENCRYPT("5123", "PSINAEBEOB39URMCN75830XMK0"),4);
insert into usuario(nome, email, senha, tipo) values("Matheus", "Matheus@Matheus", AES_ENCRYPT("15123", "PSINAEBEOB39URMCN75830XMK0"),2);
insert into usuario(nome, email, senha, tipo) values("Jorge", "Jorge@Jorge", AES_ENCRYPT("51423", "PSINAEBEOB39URMCN75830XMK0"),2);
insert into usuario(nome, email, senha, tipo) values("Henrique", "Henrique@Henrique", AES_ENCRYPT("6514", "PSINAEBEOB39URMCN75830XMK0"),4);
insert into usuario(nome, email, senha, tipo) values("Gustavo", "Gustavo@Gustavo", AES_ENCRYPT("1514", "PSINAEBEOB39URMCN75830XMK0"),1);
insert into usuario(nome, email, senha, tipo) values("Paulo", "Paulo@Paulo", AES_ENCRYPT("1642", "PSINAEBEOB39URMCN75830XMK0"),4);
insert into usuario(nome, email, senha, tipo) values("Wesley", "Wesley@Wesley", AES_ENCRYPT("1264", "PSINAEBEOB39URMCN75830XMK0"),3);
insert into usuario(nome, email, senha, tipo) values("admin","admin@admin",AES_ENCRYPT("4321", "PSINAEBEOB39URMCN75830XMK0"),1);
insert into usuario(nome, email, senha, tipo) values("recepcao","recepcao$recepcao",AES_ENCRYPT("1234", "PSINAEBEOB39URMCN75830XMK0"),2);
insert into usuario(nome, email, senha, tipo) values("instrutor","instrutor@instrutor",AES_ENCRYPT("123", "PSINAEBEOB39URMCN75830XMK0"),3);
insert into usuario(nome, email, senha, tipo) values("aluno","aluno@aluno",AES_ENCRYPT("321", "PSINAEBEOB39URMCN75830XMK0"),4);



insert into curso(nome, qtd_aulas) values("Revit",25);
insert into curso(nome, qtd_aulas) values("Auto Cad",10);
insert into curso(nome, qtd_aulas) values("Promob",15);
insert into curso(nome, qtd_aulas) values("Java",30);
insert into curso(nome, qtd_aulas) values("C#",12);
insert into curso(nome, qtd_aulas) values("Banco de Dados",22);
insert into curso(nome, qtd_aulas) values("Robotica",32);
insert into curso(nome, qtd_aulas) values("Inglês",22);
insert into curso(nome, qtd_aulas) values("Project",23);
insert into curso(nome, qtd_aulas) values("Word",15);
insert into curso(nome, qtd_aulas) values("Excel",13);
insert into curso(nome, qtd_aulas) values("Power Point",22);
insert into curso(nome, qtd_aulas) values("SketchUp",11);
insert into curso(nome, qtd_aulas) values("Logica de Programação",11);


insert into aula(id_curso, id_aluno_aula) values(14,4);
insert into aula(id_curso, id_aluno_aula) values(11,3);
insert into aula(id_curso, id_aluno_aula) values(10,9);
insert into aula(id_curso, id_aluno_aula) values(13,7);
insert into aula(id_curso, id_aluno_aula) values(1,12);
insert into aula(id_curso, id_aluno_aula) values(2,8);
insert into aula(id_curso, id_aluno_aula) values(5,6);
insert into aula(id_curso, id_aluno_aula) values(6,5);
insert into aula(id_curso, id_aluno_aula) values(8,2);
insert into aula(id_curso, id_aluno_aula) values(12,1);
insert into aula(id_curso, id_aluno_aula) values(7,13);
insert into aula(id_curso, id_aluno_aula) values(9,10);
insert into aula(id_curso, id_aluno_aula) values(3,11);
insert into aula(id_curso, id_aluno_aula) values(4,14);


insert into apostila(nome, quantidade) values("Excel",30);
insert into apostila(nome, quantidade) values("Logica de Programação",35);
insert into apostila(nome, quantidade) values("Power Point",15);
insert into apostila(nome, quantidade) values("Word",25);
insert into apostila(nome, quantidade) values("Banco de Dados",20);
insert into apostila(nome, quantidade) values("C#",12);
insert into apostila(nome, quantidade) values("Promob",18);
insert into apostila(nome, quantidade) values("Revit",21);
insert into apostila(nome, quantidade) values("Auto Cad",15);
insert into apostila(nome, quantidade) values("Robotica",11);
insert into apostila(nome, quantidade) values("Inglês",8);
insert into apostila(nome, quantidade) values("Project",17);
insert into apostila(nome, quantidade) values("Java",15);
insert into apostila(nome, quantidade) values("SketchUp",10);



insert into apostila_aluno(id_apostila, bloqueada, id_apostila_aluno) values(5, true, 12);
insert into apostila_aluno(id_apostila, bloqueada, id_apostila_aluno) values(6, true, 11);
insert into apostila_aluno(id_apostila, bloqueada, id_apostila_aluno) values(4, true, 6);
insert into apostila_aluno(id_apostila, bloqueada, id_apostila_aluno) values(1, true, 2);
insert into apostila_aluno(id_apostila, bloqueada, id_apostila_aluno) values(11, true, 3);
insert into apostila_aluno(id_apostila, bloqueada, id_apostila_aluno) values(12, true, 13);
insert into apostila_aluno(id_apostila, bloqueada, id_apostila_aluno) values(10, true, 7);
insert into apostila_aluno(id_apostila, bloqueada, id_apostila_aluno) values(9, true, 8);
insert into apostila_aluno(id_apostila, bloqueada, id_apostila_aluno) values(8, true, 9);
insert into apostila_aluno(id_apostila, bloqueada, id_apostila_aluno) values(7, true, 5);



insert into faltas(faltas, data_falta, id_aluno_faltas) values(1, "2019-05-10", 2);
insert into faltas(faltas, data_falta, id_aluno_faltas) values(1, "2019-02-31", 4);
insert into faltas(faltas, data_falta, id_aluno_faltas) values(1, "2019-07-25", 6);
insert into faltas(faltas, data_falta, id_aluno_faltas) values(1, "2019-11-30", 8);
insert into faltas(faltas, data_falta, id_aluno_faltas) values(1, "2019-01-05", 11);
insert into faltas(faltas, data_falta, id_aluno_faltas) values(1, "2019-09-09", 13);



insert into qtd_parcelas_abertas(total) values(0);
insert into parcela(valor, vencimento, id_aluno_parcela) values(250, "2019-06-10", 5);
update qtd_parcelas_abertas set total = total + 1;
insert into parcela(valor, vencimento, id_aluno_parcela) values(300, "2019-09-25", 6);
update qtd_parcelas_abertas set total = total + 1;
insert into parcela(valor, vencimento, id_aluno_parcela) values(200, "2019-02-15", 11);
update qtd_parcelas_abertas set total = total + 1;
insert into parcela(valor, vencimento, id_aluno_parcela) values(210, "2019-04-09", 2);
update qtd_parcelas_abertas set total = total + 1;
insert into parcela(valor, vencimento, id_aluno_parcela) values(152, "2019-10-10", 12);
update qtd_parcelas_abertas set total = total + 1;
insert into parcela(valor, vencimento, id_aluno_parcela) values(188, "2019-11-15", 8);
update qtd_parcelas_abertas set total = total + 1;
insert into parcela(valor, vencimento, id_aluno_parcela) values(179, "2019-05-25", 7);
update qtd_parcelas_abertas set total = total + 1;
insert into parcela(valor, vencimento, id_aluno_parcela) values(157, "2019-07-30", 9);
update qtd_parcelas_abertas set total = total + 1;
insert into parcela(valor, vencimento, id_aluno_parcela) values(252, "2019-04-01", 4);
update qtd_parcelas_abertas set total = total + 1;
insert into parcela(valor, vencimento, id_aluno_parcela) values(199, "2019-08-04", 3);
update qtd_parcelas_abertas set total = total + 1;

