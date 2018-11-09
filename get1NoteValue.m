function note = get1NoteValue( freq )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if(freq<20 || freq>2000)
    note='NIL';
else
    noteNames={'AN';'Ab';'BN';'CN';'C#';'DN';'Eb';'EN';'FN';'F#';'GN';'Ab'};
    octaves={'0';'1';'2';'3';'4';'5';'6';'7';'8';'9'};
    num=2^(1/12);
    distance=round(log(freq/440)/log(num));
    name=noteNames{mod(distance,12)+1};
    octave=octaves{round(floor((distance+9)/12)+5)};
    note=[name octave];
end
end

