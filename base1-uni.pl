% ==============================
% BASE DE CONOCIMIENTO
% ==============================

% 1. Si x es estudiante, c es clase, x estudia c y c tiene examen -> x presenta c
presenta(X,C) :- estudiante(X), clase(C), estudia(X,C), tiene_examen(C).

% -------------------
% Hechos: estudiantes
% -------------------
estudiante(ana).
estudiante(camilo).

% -------------------
% Información adicional sobre estudiantes
% -------------------
estudia(ana,matematicas).
no_becado(camilo).

% -------------------
% Becado
% -------------------
becado(X) :- estudiante(X), \+ no_becado(X), aprueba_al_menos_una(X).

% auxiliar: aprueba al menos una clase
aprueba_al_menos_una(X) :- aprueba(X,_).

% -------------------
% Existe clase (derivado de estudiante becado)
% -------------------
existe_clase :- estudiante(X), becado(X).

% -------------------
% Aprueba
% -------------------
aprueba(X,C) :- estudiante(X), clase(C), estudia(X,C).

% -------------------
% No aprueba
% -------------------
no_aprueba(X,C) :- estudiante(X), clase(C), \+ estudia(X,C).

% -------------------
% Clase
% -------------------
clase(logica).
clase(matematicas).

% -------------------
% Tiene examen
% -------------------
tiene_examen(logica).
tiene_examen(matematicas).

% -------------------
% Ciencias
% -------------------
ciencias(X) :- estudiante(X), estudia(X,logica).
ciencias(X) :- estudiante(X), estudia(X,matematicas).
