uses
  windows,jwanative;

procedure Sleep_uS(MicroSeconds: Cardinal);
const
  DelayFactor = 10;
var
  interval: LARGE_INTEGER;
begin
  interval.QuadPart := - MicroSeconds * DelayFactor;
  NtDelayExecution(False, @interval);
end;

procedure Sleep_nS(NanoSeconds: Cardinal);
const
  DelayFactor = 0.01;
var
  interval: LARGE_INTEGER;
begin
  interval.QuadPart := - Round(NanoSeconds * DelayFactor);
  NtDelayExecution(False, @interval);
end;

procedure Sleep_S(Seconds: Double);
const
  DelayFactor = 10000000;
var
  interval: LARGE_INTEGER;
begin
  interval.QuadPart := - Round(Seconds * DelayFactor);
  NtDelayExecution(False, @interval);
end;

begin
Readln;
Writeln('Sleep 1000000uS');
Sleep_uS(1000000);
Writeln('Sleep 1000000000nS');
Sleep_nS(1000000000);
Writeln('Sleep 1S');
Sleep_S(1);
Writeln('Done');
Readln;
end.
