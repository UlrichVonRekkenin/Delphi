unit DuckSimulator;

interface

uses Classes, SysUtils, AbstractDuckFactory, Duck, Goose, Flock,
  QuackLogist, Interfaces;

type

  TAbstractDuckSimulator = class(TPersistent)
  private
  public
    procedure simulate(); virtual; abstract;
  end;

  TDuckSimulator = class(TAbstractDuckSimulator)
  private
  public
    procedure simulate(); overload; override;
    procedure simulate(aDuck: IQuackable); reintroduce; overload;
  end;

  TFactoryDuckSimulator = class(TAbstractDuckSimulator)
  private
  public
    procedure simulate(duckFactory: TAbstractDuckFactory); reintroduce; overload;
    procedure simulate(aDuck: IQuackable); reintroduce; overload;
  end;

  TFlockFactoryDuckSimulator = class(TAbstractDuckSimulator)
  private
  public
    procedure simulate(duckFactory: TAbstractDuckFactory); reintroduce; overload;
    procedure simulate(aDuck: IQuackable); reintroduce; overload;
  end;

  TDuckSimulatorWithFlockObserverAndCounting = class(TAbstractDuckSimulator)
  private
  public
    procedure simulate(duckFactory: TAbstractDuckFactory); reintroduce; overload;
    procedure simulate(aDuck: IQuackable); reintroduce; overload;
  end;

implementation

{ TDuckSimulator }

procedure TDuckSimulator.simulate;
var
  malardDuck: IQuackable;
  redheadDuck: IQuackable;
  duckCall: IQuackable;
  rubberDuck: IQuackable;
  gooseDuck: IQuackable;
begin

  malardDuck := TQuackConter.Create(TMalardDuck.Create);
  redheadDuck := TQuackConter.Create(TRedheadDuck.Create);
  duckCall := TQuackConter.Create(TDuckCall.Create);
  rubberDuck := TQuackConter.Create(TRubberDuck.Create);
  gooseDuck := TGooseAdapter.Create(TGoose.Create);

  Writeln(#13#10'Duck Simulator...'#13#10);

  simulate(malardDuck);
  simulate(redheadDuck);
  simulate(duckCall);
  simulate(rubberDuck);
  simulate(gooseDuck);

  Writeln(Format(#13#10'The duck quacked %d times.'#13#10, [TQuackConter.NumberOfQuack]));
end;

procedure TDuckSimulator.simulate(aDuck: IQuackable);
begin
  aDuck.quack;
end;

{ TFactoryDuckSimulator }

procedure TFactoryDuckSimulator.simulate(aDuck: IQuackable);
begin
  aDuck.quack();
end;

procedure TFactoryDuckSimulator.simulate(duckFactory: TAbstractDuckFactory);
var
  malardDuck: IQuackable;
  redheadDuck: IQuackable;
  duckCall: IQuackable;
  rubberDuck: IQuackable;
  gooseDuck: IQuackable;
begin

  malardDuck := duckFactory.CreateMalardDuck;
  redheadDuck := duckFactory.CreateRedheadDuck;
  duckCall := duckFactory.CreateDuckCall;
  rubberDuck := duckFactory.CreateRubberDuck;
  gooseDuck := TGooseAdapter.Create(TGoose.Create);

  Writeln(#13#10'Duck Simulator...'#13#10);

  simulate(malardDuck);
  simulate(redheadDuck);
  simulate(duckCall);
  simulate(rubberDuck);
  simulate(gooseDuck);

  Writeln(Format(#13#10'The duck quacked %d times.'#13#10, [TQuackConter.NumberOfQuack]));
end;

{ TFlockFactoryDuckSimulator }

procedure TFlockFactoryDuckSimulator.simulate(duckFactory: TAbstractDuckFactory);
var
  flockOfMalardDucks: TFlock;
  flockOfDuck: TFlock;
begin

  Writeln(#13#10'Duck Simulator - With of Malard Duck (Composite Flock)...'#13#10);
  flockOfMalardDucks := TFlock.Create;
  flockOfMalardDucks.add(duckFactory.CreateMalardDuck);
  flockOfMalardDucks.add(duckFactory.CreateMalardDuck);
  simulate(flockOfMalardDucks);

  Writeln(#13#10'Duck Simulator - Composite Flock...'#13#10);
  flockOfDuck := TFlock.Create;
  flockOfDuck.add(duckFactory.CreateMalardDuck);
  flockOfDuck.add(duckFactory.CreateRedheadDuck);
  flockOfDuck.add(duckFactory.CreateDuckCall);
  flockOfDuck.add(duckFactory.CreateRubberDuck);
  simulate(flockOfDuck);

  Writeln(Format(#13#10'The duck quacked %d times.'#13#10, [TQuackConter.NumberOfQuack]));
end;

procedure TFlockFactoryDuckSimulator.simulate(aDuck: IQuackable);
begin
  aDuck.quack;
end;

{ TDuckSimulatorWithFlockObserverAndCounting }

procedure TDuckSimulatorWithFlockObserverAndCounting.simulate
  (duckFactory: TAbstractDuckFactory);
var
  flockOfMalardDucks: TFlock;
  flockOfDuck: TFlock;
  quackLogistForMalardDuck: TQuackLogist;
  quackLogistForFlock: TQuackLogist;
begin

  Writeln(#13#10'Duck Simulator - With of Malard Duck (Composite Flock)...'#13#10);
  flockOfMalardDucks := TFlock.Create;
  flockOfMalardDucks.add(duckFactory.CreateMalardDuck);
  flockOfMalardDucks.add(duckFactory.CreateMalardDuck);

  quackLogistForMalardDuck := TQuackLogist.Create;
  flockOfMalardDucks.registerObserver(quackLogistForMalardDuck);

  simulate(flockOfMalardDucks);

  /// ///////////////////////////
  Writeln(#13#10'Duck Simulator - Composite Flock...'#13#10);
  flockOfDuck := TFlock.Create;
  flockOfDuck.add(duckFactory.CreateMalardDuck);
  flockOfDuck.add(duckFactory.CreateRedheadDuck);
  flockOfDuck.add(duckFactory.CreateDuckCall);
  flockOfDuck.add(duckFactory.CreateRubberDuck);

  quackLogistForFlock := TQuackLogist.Create;
  flockOfDuck.registerObserver(quackLogistForFlock);
  simulate(flockOfDuck);

  Writeln(Format(#13#10'The duck quacked %d times.'#13#10, [TQuackConter.NumberOfQuack]));
end;

procedure TDuckSimulatorWithFlockObserverAndCounting.simulate(aDuck: IQuackable);
begin
  aDuck.quack;
end;

end.
