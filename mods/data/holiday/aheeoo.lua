function onCreatePost()
    makeLuaText('t', ' ' ,500, 500, 200);
    setTextSize('t', 20)
    addLuaText('t', true)
    makeLuaText('o', ' ' ,500, 0, 200);
    setTextSize('o', 20)
    addLuaText('o', true)
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteData == 0 then
        if not isSustainNote then
        setTextString('t', getTextString('t')..' ehh')
    else
        setTextString('t', getTextString('t')..'h')
    end
    end
    if noteData == 1 then
        if not isSustainNote then
            setTextString('t', getTextString('t')..' ooo')
        else
            setTextString('t', getTextString('t')..'o')
        end
    end
    if noteData == 2 then
        if not isSustainNote then
        setTextString('t', getTextString('t')..' ahh')
    else
        setTextString('t', getTextString('t')..'h')
    end
    end
    if noteData == 3 then
        if not isSustainNote then
        setTextString('t', getTextString('t')..' e')
    else
        setTextString('t', getTextString('t')..'e')
    end
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if noteData == 0 then
        if not isSustainNote then
        setTextString('o', getTextString('o')..' ehh')
    else
        setTextString('o', getTextString('o')..'h')
    end
    end
    if noteData == 1 then
        if not isSustainNote then
            setTextString('o', getTextString('o')..' ooo')
        else
            setTextString('o', getTextString('o')..'o')
        end
    end
    if noteData == 2 then
        if not isSustainNote then
        setTextString('o', getTextString('o')..' ahh')
    else
        setTextString('o', getTextString('o')..'h')
    end
    end
    if noteData == 3 then
        if not isSustainNote then
        setTextString('o', getTextString('o')..' e')
    else
        setTextString('o', getTextString('o')..'e')
    end
    end
end