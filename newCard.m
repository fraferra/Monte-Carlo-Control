function soln = newCard()

        %Draw a new card
        newColor=randi(3);
        newNumber=randi(10);

        if newColor== 1 || newColor == 2
            soln=newNumber;
        else
            soln=-newNumber;
        end

end

