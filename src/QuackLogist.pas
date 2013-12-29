unit QuackLogist;

interface

uses Classes, Interfaces;

type
  TQuackLogist = class(TInterfacedObject, IObserver)
    procedure update(aDuck: IQuackObservable);
  end;

implementation

{ TQuackLoagist }

procedure TQuackLogist.update(aDuck: IQuackObservable);
begin
  Writeln('Quacklogist: ' + TObject(aDuck).ClassName + ' just quacked.');
end;

end.
