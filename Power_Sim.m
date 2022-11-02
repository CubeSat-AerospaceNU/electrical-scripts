%% Initialize variables for each 
%syms solar obc adcs rec tran Trec Ttran;
wH = 80; % nubmer of watt hours
wS = wH * 3600; % number of watt seconds

% solar panel (the only input)
solarVals = num2cell([1,2,3]);
[solarMax, solarMin, solarAvg] = deal(solarVals{:});

% onboard computer
obcVals = num2cell([1,2,3]);
[obcMin, obcMax, obcAvg] = deal(obcVals{:});

% altitude control device
adcsVals = num2cell([1,2,3]);
[adcsMin, adcsMax, adcsAvg] = deal(adcsVals{:});

% receivers (main then THz)
recVals = num2cell([1,2,3]);
[recMin, recMax, recAvg] = deal(recVals{:});

TrecVals = num2cell([1,2,3]);
[TrecMin, TrecMax, TrecAvg] = deal(TrecVals{:});


% transmitters
tranVals = num2cell([1,2,3]);
[tranMin, tranMax, tranAvg] = deal(tranVals{:});

TtranVals = num2cell([1,2,3]);
[TtranMin, TtranMax, TtranAvg] = deal(TtranVals{:});

% TODO: add the runtimes 

%% Solve the system of equations for power needs
syms solar;

worstCase = solar - obcMax - adcsMax - recMax - tranMax - TrecMax - TtranMax == wS;
%bestCase = solar - obc - adcs - rec - tran - Trec - Ttran == wS;
%avgOperational = solar - obc - adcs - rec - tran - Trec - Ttran == wS;
%eqn4 = solar - obc - adcs - rec - tran - Trec - Ttran == wS;


%% Get the results
solSolar = solve(worstCase, solar,'Real',true);
double(solSolar);
%print(A);
%[A] = equationsToMatrix([worstCase], [solar])
%res = linsolve(A)

%print(res);