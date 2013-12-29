program pattern_duck;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Duck in 'src\Duck.pas',
  Goose in 'src\Goose.pas',
  Interfaces in 'src\Interfaces.pas',
  AbstractDuckFactory in 'src\AbstractDuckFactory.pas',
  DuckSimulator in 'src\DuckSimulator.pas',
  Flock in 'src\Flock.pas',
  Observable in 'src\Observable.pas',
  QuackLogist in 'src\QuackLogist.pas';

var
  simulator: TAbstractDuckSimulator;

begin
  try
    {
      Writeln('Simple Simulator:'#13#10);
      simulator := TDuckSimulator.Create;
      simulator.simulate;
    }
    {
    Writeln('Factory with Counting Simulator:');
      simulator := TFactoryDuckSimulator.Create;
      TFactoryDuckSimulator(simulator).simulate(TCountingDuckFactory.Create);
    }
    {
      Writeln('Factory with Counting Simulator and Flock:');
      simulator := TFlockFactoryDuckSimulator.Create;
      TFlockFactoryDuckSimulator(simulator).simulate(TCountingDuckFactory.Create);
    }
    Writeln('Factory with Counting Simulator and Flock and Observers:');
    simulator := TDuckSimulatorWithFlockObserverAndCounting.Create;
    TDuckSimulatorWithFlockObserverAndCounting(simulator)
      .simulate(TCountingDuckFactory.Create);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
