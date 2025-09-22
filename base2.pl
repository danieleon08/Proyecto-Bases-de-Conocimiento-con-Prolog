% ==============================
% BASE DE CONOCIMIENTO: PACIENTES Y MEDICOS
% ==============================

% ---- Hechos: Pacientes ----
paciente(p).
paciente(pedro).

% ---- Hechos: Médicos ----
medico(laura).

% ---- Hechos: Fiebre ----
fiebre(pedro).

% ---- Hechos: Diagnóstico ----
diagnostico(p).

% ==============================
% Reglas
% ==============================

% 1. Todo paciente que tiene fiebre presenta síntomas
sintoma(X) :- paciente(X), fiebre(X).

% 2. Si un paciente tiene cáncer, entonces está en tratamiento
tratamiento(X) :- paciente(X), cancer(X).

% 4. Si un paciente no tiene diagnóstico, entonces no es atendido por ningún medico
%    (Se modela como: para ser atendido debe tener diagnóstico)
no_atendido(X,Y) :- paciente(X), medico(Y), not(diagnostico(X)).

% 5. Todo medico atiende a un paciente que o tiene fiebre o tiene diagnóstico
atiende(Y,X) :- medico(Y), paciente(X), (fiebre(X) ; diagnostico(X)).
