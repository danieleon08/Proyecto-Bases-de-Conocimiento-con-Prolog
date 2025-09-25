% ==============================
% BASE DE CONOCIMIENTO PACIENTES
% ==============================

% ----------- PACIENTES -----------
paciente(p3).
paciente(pedro).

% ----------- MEDICOS -------------
medico(laura).
medico(X) :- medico_turno(X).

% ----------- MEDICOS EN TURNO ----
medico_turno(t15).

% ----------- DIAGNOSTICOS --------
diagnostico(p4).

% ----------- FIEBRE --------------
fiebre(pedro).

% ----------- SINTOMAS ------------
sintoma(X) :- paciente(X), fiebre(X).

% ----------- TRATAMIENTO ---------
tratamiento(X) :- paciente(X), cancer(X).

% ----------- PRIORITARIOS --------
prioritario(X) :- fiebre(X).
prioritario(X) :- diagnostico(X).

% ----------- ATIENDE -------------
atiende(Y,X) :- medico(Y), diagnostico(X).
atiende(Y,X) :- medico(Y), paciente(X), (fiebre(X); diagnostico(X)).
atiende(Y,X) :- medico(Y), paciente(X).
atiende(_,X) :- prioritario(X), paciente(X).

% ----------- REGISTRADOS ---------
registrado(X) :- atiende(_,X).
