codeunit 80313 "RecRef Management TTT-MSRRS"
{
    procedure SumFields(var pRecRef: RecordRef)
    var
        tmpRecRefSum: Record "RecRef Sum TTT-MSRRS" temporary;
        recRef: RecordRef;
        fieldRef: FieldRef;
        decimal: Decimal;
        noofRows: Integer;
        fieldCounter: Integer;

    begin
        with recRef do begin
            recRef := pRecRef.Duplicate();
            if not FindFirst() then
                exit;
            repeat
                noofRows += 1;
                for fieldCounter := 1 to FieldCount() do begin
                    fieldRef := FieldIndex(fieldCounter);
                    if fieldref.Active() then
                        if format(fieldref.Type()) in ['Integer', 'Decimal'] then begin
                            decimal := 0;
                            case format(fieldref.Class()) of
                                'Normal':
                                    decimal := fieldRef.Value();
                                'FlowField':
                                    begin
                                        fieldRef.CalcField();
                                        decimal := fieldRef.Value();
                                    end;
                            end;
                            if decimal <> 0 then
                                if tmpRecRefSum.get(fieldRef.Number()) then begin
                                    tmpRecRefSum.Sum += decimal;
                                    tmpRecRefSum.Modify();
                                end
                                else begin
                                    tmpRecRefSum."Field No." := fieldRef.Number();
                                    tmpRecRefSum."Field Caption" := copystr(fieldRef.Caption(), 1, MaxStrLen(tmpRecRefSum."Field Caption"));
                                    tmpRecRefSum.sum := decimal;
                                    if tmpRecRefSum.insert() then;
                                end;
                        end;
                end;
            until next() = 0;
            tmpRecRefSum.init();
            tmpRecRefSum."Field No." := 0;
            tmpRecRefSum."Field Caption" := '';
            tmpRecRefSum.Sum := noofRows;
            if tmpRecRefSum.insert() then;
            page.RunModal(page::"RecRef Sum TTT-MSRRS", tmpRecRefSum);
        end;

        // ???
        //        FOR i := 1 TO 10 DO BEGIN
        //            locdecMax += 9 * POWER(10, 62);
        //        END;
        //        FOR i := 46 TO 62 DO BEGIN
        //            locdecMax += 9 * POWER(10, i);
        //        END;

        //            IF locdecMax - ABS(tmpRecRefSum.Sum) - ABS(decimal) < 0 THEN
        //              tmpRecRefSum.Sum := locdecMax * (ABS(tmpRecRefSum.Sum) / tmpRecRefSum.Sum)

    end;
}