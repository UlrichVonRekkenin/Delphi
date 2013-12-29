unit AbstractDuckFactory;

interface

uses Classes, Duck, Interfaces;

type
  TAbstractDuckFactory = class(TPersistent)
    function CreateMalardDuck(): IQuackable; virtual; abstract;
    function CreateRedheadDuck(): IQuackable; virtual; abstract;
    function CreateDuckCall(): IQuackable; virtual; abstract;
    function CreateRubberDuck(): IQuackable; virtual; abstract;
  end;

  TDuckFactory = class(TAbstractDuckFactory)
    function CreateMalardDuck(): IQuackable; override;
    function CreateRedheadDuck(): IQuackable; override;
    function CreateDuckCall(): IQuackable; override;
    function CreateRubberDuck(): IQuackable; override;
  end;

  TCountingDuckFactory = class(TAbstractDuckFactory)
    function CreateMalardDuck(): IQuackable; override;
    function CreateRedheadDuck(): IQuackable; override;
    function CreateDuckCall(): IQuackable; override;
    function CreateRubberDuck(): IQuackable; override;
  end;

implementation

{ TDuckFactory }

function TDuckFactory.CreateDuckCall: IQuackable;
begin
  Result := TDuckCall.Create;
end;

function TDuckFactory.CreateMalardDuck: IQuackable;
begin
  Result := TMalardDuck.Create;
end;

function TDuckFactory.CreateRedheadDuck: IQuackable;
begin
  Result := TRedheadDuck.Create;
end;

function TDuckFactory.CreateRubberDuck: IQuackable;
begin
  Result := TRubberDuck.Create;
end;

{ TCountingDuckFactory }

function TCountingDuckFactory.CreateDuckCall: IQuackable;
begin
  Result := TQuackConter.Create(TDuckCall.Create);
end;

function TCountingDuckFactory.CreateMalardDuck: IQuackable;
begin
  Result := TQuackConter.Create(TMalardDuck.Create);
end;

function TCountingDuckFactory.CreateRedheadDuck: IQuackable;
begin
  Result := TQuackConter.Create(TRedheadDuck.Create);
end;

function TCountingDuckFactory.CreateRubberDuck: IQuackable;
begin
  Result := TQuackConter.Create(TRubberDuck.Create);
end;

end.
