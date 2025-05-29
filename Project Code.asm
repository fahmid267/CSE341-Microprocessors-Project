                                                          .MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES
    
    ; TITLE
    s1 DB 10,13,"                     Hotel and Restaurant Management System$" 
    
    
    ; TITLE PAGE
    accomd DB 10,13,"     Accomodations       :     Press 1$"
    foods DB 10,13,"     Foods               :     Press 2$"
    login DB 10,13,"     Login               :     Press L$ "
    register DB 10,13,"     Register            :     Press R$"
    logout DB 10,13,"     Logout              :     Press l$"
    roombook DB 10,13,"     Room Bookings       :     Press 3$"
    foodorders DB 10,13,"     Food Orders         :     Press 4$"
    roomser DB 10,13,"     Room Service        :     Press 3$"
    maintainreq DB 10,13,"     Maintenance Request:     Press 5$"
    
    
    ; HEADERS
    roomavail DB 10,13,"                          ***   Room Details   ***$"
    foodmenu DB 10,13,"                       ***   Restaurant Food Menu  ***$"
    roomserheader DB 10,13,"                       ***   Room Service ***$"
                                            
    
    ; INPUTS
    input DB 10,13,"     Please enter your input: $"
    validinput DB 10,13,"     Please enter a valid input: $"
    username DB 10,13,"     Username: $"
    pass DB 10,13,"     Password: $"
    wrongcred DB 10,13,"     Please specify a valid user (A/C):$ "
    userspec DB 10,13,"     Please specify user (A/C): $"
    bookroom DB 10,13,"     Book a Room: 1/2/3$"
    goback DB 10, 13,"     Go Back     : Backspace$"
    foodorder DB 10,13,"     Order Foods: 1/2/3/4/5/6/7$"
    wronginput DB 10,13,"     ---> You Entered a Wrong Input <---$"
    
    
    ; USER DATA
    adminusername DB 97,100,109,105,110
    adminpass1 DB 49,50,51,52          
    custusername DB 50 dup(" ")
    custpass1 DB 50 dup(" ")
    firstletter DB 0
    
    
    ; CREDENTIALS
    adminid DB 50 dup(" ")
    adminpass2 DB 5 dup(" ")
    custid DB 50 dup(" ")
    custpass2 DB 9 dup(" ")
    
    ; MISCELLANEOUS
    regsuccess DB 10,13,"     Registration Successfull!$"
    custloginactive DB 0
    adloginactive DB 0
    break DB 10,13,"$"
    logsuccess DB 10,13,"     Login Successful!$"
    loggingout DB 10, 13, "     Logged Out$"
    logfail DB 10,13, "     Login Failed! Wrong credentials$"
    cmt1 DB 10,13,"     Please log in to book a room.$"
    cmt2 DB 10,13,"     Please log in to order foods.$"   
    booked DB 10,13,"     ------ Booking Sucessful -------$"  
    notavail DB 10,13,"     ----- Room Not Available ------$"  
    regpointer1 DW 0
    regpointer2 DW 0
    custidlength DB 0
    custpasslength DB 0
    ordereditem DB 10,13,"     Ordered Item: $"
    regpage DB 10,13,"                          *** Customer Registration ***$"
    custlogpage DB 10,13,"                         *** Customer Login ***$"
    adlogpage DB 10,13,"                             *** Admin Login ***$"
    billstring DB 10,13,"     Total Bill: $"
    bill DW 0
    roombookarr DB 50 dup(" ")
    r1bookers DB 50 dup(" ")
    r2bookers DB 50 dup(" ")
    r3bookers DB 50 dup(" ")
    r1pointer DW 0
    r2pointer DW 0
    r3pointer DW 0
    bookpointer1 DB 0
    bookpointer2 DB 0
    bookpointer3 DB 0
    nobooks DB "No Bookings$"
    blank DB 10,13,"        $"
    
    
    ; ROOM DETAILS
    r1 DB 10,13,"        1. Premium Suite     = Tk 10000   available $"
    r2 DB 10,13,"        2. Luxury Suite      = Tk 15000   available $"
    r3 DB 10,13,"        3. VIP Suite         = Tk 20000   available $"


    rq1 DB 32h
    rq2 DB 33h 
    rq3 DB 34h

    
    roombooks DB 10,13,"     Room Bookings:     Press$"
    
    prembook DB 10,13,"        1. Premium Suite Bookings     = Press 1$"
    luxbook DB 10,13,"        2. Luxury Suite Bookings      = Press 2$"
    vipbook DB 10,13,"        3. VIP Suite Bookings         = Press 3$"
    
    prem DB 10,13,"     Premium Suite Bookings: $"
    lux DB 10,13,"     Luxury Suite Bookings: $"
    vip DB 10,13,"     VIP Suite Bookings: $"
    
    userroombooked DB 0
    
    
    ; FOOD DETAILS
    f1 DB 10,13,"        1. Chicken Fry     = Tk 100$"
    f2 DB 10,13,"        2. Burger          = Tk 200$"
    f3 DB 10,13,"        3. Shwarma         = Tk 90$"
    f4 DB 10,13,"        4. Salad           = Tk 50$"
    f5 DB 10,13,"        5. Sandwitch       = Tk 60$"
    f6 DB 10,13,"        6. Juice           = Tk 50$"
    f7 DB 10,13,"        7. French Fry      = Tk 80$"
    
    
    ; MAINTENANCE DETAILS
    m1 DB 10,13,"        1. Room Service$"
    m2 DB 10,13,"        2. Washroom Cleaning$"
    m3 DB 10,13,"        3. Plumbing$"
    m4 DB 10,13,"        4. Laundry$"
    m5 DB 10,13,"        5. Extra Bed$"
    m6 DB 10,13,"        6. Electrical Help$"
    
    reqarr DB 50 dup(" ")
    
    ; ROOM SERVICE DETAILS
    rs1 DB 10,13,"        1. Room Cleaning $"
    rs2 DB 10,13,"        2. Electricity Problem  $"
    rs3 DB 10,13,"        3. Water related   $"
    rs4 DB 10,13,"        4. Londry $" 
    
    complain   DB 10,13,"     *** Thank You. We are sending a service man as soon as possible. ***$" 

    

.CODE  
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE 
        
        LEA DX, s1
        CALL print
        
        start:
        LEA DX, break
        CALL print
        INT 21H
        
        
        LEA DX, accomd
        CALL print
        
        LEA DX, foods
        CALL print
        
        
        CMP custloginactive, 0
        JNE loggedin
        
        CMP adloginactive, 0
        JNE loggedin
        
        
        LEA DX, login
        CALL print
        
        LEA DX, register
        CALL print
        
        LEA DX, break
        CALL print
        
        JMP inp1
        
        
        ; CHECKS IF USER IS ALREADY LOGGED IN
        loggedin:
        CMP adloginactive, 0
        JE adinactiveblock
        
        ;CMP userroombooked, 0
        ;JNE adinactiveblock
        
        LEA DX, roombook
        CALL print
        
        LEA DX, foodorders
        CALL print
        
        LEA DX, maintainreq
        CALL print
        
        adinactiveblock:
        CMP userroombooked, 1
        JNE skip4
        
        LEA DX, roomser
        CALL print
        
        skip4:
        LEA DX, logout
        CALL print
        
        LEA DX, break
        CALL print
        
        
        
        inp1:
        LEA DX, input
        CALL print
        
        
        ; CHECKS USER INPUT
        inp2:
        MOV AH, 1
        INT 21H
        
        CMP AL, 4CH
        JE user
        
        CMP AL, 52H
        JE reg
        
        CMP AL, 6CH
        JE log_out
        
        SUB AL, 30H
        CMP AL, 1
        JE roomdtls
        
        CMP AL, 2
        JE fooddtls
        
        CMP AL, 3
        JE bookings
        
        
        
        
        LEA DX, break
        CALL print
        
        
        ; CHECKS FOR A VALID INPUT
        LEA DX, validinput
        CALL print
        
        JMP inp2
        
        
        ; USER SPECIFY (ADMIN/CUSTOMER)
        user:
        LEA DX, break
        CALL print
        
        LEA DX, userspec
        CALL print
        
        specinp:
        MOV AH, 1
        INT 21H
        
        MOV BL, AL                 ; BL = user notation (A/C)
        
        
        ; GOES TO ADMIN LOGIN BLOCK
        CMP AL, 41H
        JE adminlogin
        
        
        ; GOES TO CUSTOMER LOGIN BLOCK
        CMP AL, 43H
        JE custlogin
        
        LEA DX, break
        CALL print
        
        
        ; IF WRONG CREDENTIALS ARE ENTERED
        LEA DX, wrongcred
        CALL print
        
        Loop specinp
        
        
        ; ADMIN LOGIN
        adminlogin:
        LEA DX, break
        CALL print
        CALL print
        LEA DX, adlogpage
        CALL print
        LEA DX, break
        CALL print
        
        LEA DX, username
        CALL print
        
        MOV AH, 1
        LEA SI, adminid
        
        
        ; ADMIN USERNAME INPUT
        takeid1:
        INT 21H
        MOV [SI], AL
        
        CMP [SI], 13
        JE next1
        
        INC SI
        
        Loop takeid1
        
        
        ; ADMIN PASSWORD INPUT
        next1:
        LEA DX, pass
        CALL print
        
        MOV AH, 1
        LEA SI, adminpass2
        
        takepass1:
        INT 21H
        MOV [SI], AL
        
        CMP [SI], 13
        JE checkadlogin
        
        INC SI
        
        Loop takepass1
        
        
        ; CUSTOMER LOGIN BLOCK
        custlogin:
        LEA DX, break
        CALL print
        CALL print
        LEA DX, custlogpage
        CALL print
        LEA DX, break
        CALL print
        
        
        LEA DX, username
        CALL print
        
        MOV AH, 1
        MOV SI, 0
        MOV DL, 0
        
        
        ; CUSTOMER USERNAME INPUT
        takeid2:
        INT 21H
        MOV custid[SI], AL
        
        CMP custid[SI], 13
        JE next2
        
        INC SI
        INC DL
        
        Loop takeid2
        
        
        ; CUSTOMER PASSWORD INPUT
        next2:
        MOV custidlength, DL
        
        LEA DX, pass
        CALL print
        
        MOV AH, 1
        MOV SI, 0
        MOV DH, 0
        
        
        takepass2:
        INT 21H
        MOV custpass2[SI], AL
        
        CMP custpass2[SI], 13
        JE checkcustlogin
        
        INC SI
        INC DH
        
        Loop takepass2
        
        
        ; CHECKS ADMIN INPUT CREDENTIALS
        checkadlogin:
        MOV SI, 0
        MOV DI, 0
        
        check1:
        MOV BH, adminusername[SI]
        CMP BH, adminid[DI]
        JNE adloginfail
        
        INC SI
        INC DI
        
        CMP SI, 5
        JGE next4
        
        Loop check1
        
        next4:
        MOV SI, 0
        MOV DI, 0
        
        check2:
        MOV BH, adminpass1[SI]
        CMP BH, adminpass2[DI]
        JNE adloginfail
        
        INC SI
        INC DI
        
        CMP SI, 4
        JGE loginsuccess
        
        Loop check2
        
        
        ; LOGIN SUCCESSFUL
        loginsuccess:
        LEA DX, break
        CALL print
        
        LEA DX, logsuccess
        CALL print
        
        CMP BL, 41H
        JE adlog
        
        MOV custloginactive, 1
        JMP start 
        
        adlog:
        MOV adloginactive, 1
        JMP start
        
        
        ; ADMIN LOGIN FAILED
        adloginfail:
        LEA DX, break
        CALL print
        
        LEA DX, logfail
        CALL print
        
        JMP start
        
        
        ; CHECKS CUSTOMER INPUT CREDENTIALS
        checkcustlogin:
        MOV custpasslength, DH
        
        CMP custidlength, 0
        JE custloginfail
        
        CMP custpasslength, 0
        JE custloginfail
        
        
        MOV SI, 0
        MOV DI, 0
        MOV DL, 0
        
        
        check3:
        INC DL
        
        
        MOV BH, custusername[SI]
        CMP BH, custid[DI]
        JNE check5
        
        CMP DL, custidlength
        JGE next5
        
        INC SI
        INC DI
        
        Loop check3
        
        check5:
        INC SI
        
        MOV BH, custusername[SI]
        MOV firstletter, BH
        
        CMP custusername[SI], " "
        JE custloginfail
        
        
        MOV DI, 0
        MOV DL, 0
        
        JMP check3
        
        
        next5:
        MOV SI, 0
        MOV DI, 0
        MOV DH, 0
        
        check4:
        INC DH
        
        MOV BH, custpass1[SI]
        CMP BH, custpass2[DI]
        JNE check6
        
        CMP DH, custpasslength
        JGE loginsuccess
        
        INC SI
        INC DI
        
        Loop check4
        
        check6:
        INC SI
        
        CMP custpass1[SI], " "
        JE custloginfail
        
        
        MOV DI, 0
        MOV DL, 0
        
        JMP check4
        
        
        ; CUSTOMER LOGIN FAILED
        custloginfail:
        LEA DX, break
        CALL print
        
        LEA DX, logfail
        CALL print
        
        JMP start
        
        
        ; LOGGED OUT STRING OUTPUT
        log_out:
        LEA DX, break
        CALL print
        
        LEA DX, loggingout
        CALL print
        
        CMP adloginactive, 1
        JE adlognot
        
        MOV custloginactive, 0
        MOV userroombooked, 0
        MOV bill, 0
        JMP start
        
        adlognot:
        MOV adloginactive, 0
        JMP start
        
        
        ; CUSTOMER REGISTRATION
        reg:
        LEA DX, break
        CALL print
        CALL print
        LEA DX, regpage
        CALL print
        LEA DX, break
        CALL print
        
        
        LEA DX, username
        CALL print
        
        
        MOV AH, 1
        MOV DI, regpointer1
        
        
        ; CUSTOMER USERNAME REGISTRATION
        regidinp:
        INT 21H
        MOV custusername[DI], AL
        
        
        CMP custusername[DI], 13
        JE next3
        
        
        INC DI
        
        Loop regidinp
        
        
        next3:
        MOV regpointer1, DI
        
        LEA DX, pass
        CALL print
        
        MOV AH, 1
        MOV BX, regpointer2
        
        
        ; CUSTOMER PASSWORD REGISTRATION
        regpassinp:
        INT 21H
        MOV custpass1[BX], AL
        
        
        CMP custpass1[BX], 13
        JE registered
        
        
        INC BX
        
        Loop regpassinp
        
        
        ; REGISTRATION SUCCESSFUL
        registered:
        MOV regpointer2, BX
        
        
        LEA DX, break
        CALL print
        LEA DX, regsuccess
        CALL print
        
        JMP start
        
        
        
        ; PRINTING ALL ROOM DETAILS
        roomdtls:
        LEA DX, break
        CALL print
        
        
        LEA DX, roomavail
        CALL print
        
        LEA DX, break
        CALL print
        
        LEA DX, r1
        CALL print 
        
        MOV DL, rq1
        CALL printc  
        
        
        LEA DX, r2
        CALL print
         
        MOV DL, rq2
        CALL printc
        
        
        LEA DX, r3
        CALL print
        
        MOV DL, rq3
        CALL printc
        
        
        LEA DX, break
        CALL print
        
        
        CMP custloginactive, 0
        JE back1
        
        LEA DX, bookroom
        CALL print
        LEA DX, goback
        CALL print
        
        LEA DX, break
        CALL print
        
        JMP inp3
        
        back1:
        CMP adloginactive, 1
        JE skip1
        
        LEA DX, cmt1
        CALL print
        LEA DX, break
        CALL print
        
        skip1:
        LEA DX, goback
        CALL print
        
        LEA DX, break
        CALL print
        
        
        ; CHECKS USER INPUT
        inp3:
        LEA DX, input
        CALL print
        
        MOV AH, 1
        INT 21H
        
        CMP AL, 08H
        JE start
        
        CMP custloginactive, 0
        JE inp6
        
        
        ; ROOM BOOKINGS CHECK
        CMP AL, 31H 
        JE book1
        
        CMP AL, 32H
        JE book2
        
        CMP AL, 33H
        JE book3
        
        
        book1:
        CMP rq1,30H
        JE notavailable
        
        DEC rq1
        MOV userroombooked, 1
        
        
        MOV SI, r1pointer
        MOV DI, 0
        MOV CL, 0
        
        copy1:
        MOV CH, custid[DI]
        MOV r1bookers[SI], CH
        
        INC CL
        INC SI
        INC DI
        
        
        CMP CL, custidlength
        JL copy1
        
        MOV r1bookers[SI], "/"
        MOV r1pointer, SI
        INC r1pointer
        
        
        LEA DX, break
        CALL print
        LEA DX, booked
        CALL print
        LEA DX, break
        CALL print
        
        JMP roomdtls
         
        
        book2:
        CMP rq2, 30H
        JE notavailable
        
        DEC rq2
        MOV userroombooked, 1 
        
        MOV SI, r2pointer
        MOV DI, 0
        MOV CL, 0
        
        copy2:
        MOV CH, custid[DI]
        MOV r2bookers[SI], CH
        
        INC CL
        INC SI
        INC DI
        
        CMP CL, custidlength
        JL copy2
        
        MOV r2bookers[SI], "/"
        MOV r2pointer, SI
        INC r2pointer
        
        LEA DX, break
        CALL print
        LEA DX, booked
        CALL print
        LEA DX, break
        CALL print
        
        JMP roomdtls
        
        
        book3:
        CMP rq3,30H
        JE notavailable
        
        DEC rq3
        MOV userroombooked, 1
        
        MOV SI, r3pointer
        MOV DI, 0
        MOV CL, 0
        
        copy3:
        MOV CH, custid[DI]
        MOV r3bookers[SI], CH
        
        INC CL
        INC SI
        INC DI
        
        CMP CL, custidlength
        JL copy3
        
        MOV r3bookers[SI], "/"
        MOV r3pointer, SI
        INC r3pointer
        
        LEA DX, break
        CALL print
        LEA DX, booked
        CALL print
        LEA DX, break
        CALL print
        
        JMP roomdtls
         
        
        ; ROOM NOT AVAILABLE STRING OUTPUT
        notavailable:
        LEA DX, notavail
        CALL print
        JMP roomdtls
        
        
        inp4:
        LEA DX, break
        CALL print
        
        LEA DX, validinput
        CALL print
        
        MOV AH, 1
        INT 21H
        
        CMP AL, 08H
        JE start
        
        Loop inp4
        
        
        ; PRINTING ALL FOOD DETAILS
        fooddtls:
        LEA DX, break
        CALL print
        INT 21H
        LEA DX, foodmenu
        CALL print
        LEA DX, break
        CALL print
        
        LEA DX, f1
        INT 21H
        LEA DX, f2
        INT 21H
        LEA DX, f3
        INT 21H
        LEA DX, f4
        INT 21H
        LEA DX, f5
        INT 21H
        LEA DX, f6
        INT 21H
        LEA DX, f7
        INT 21H
        
        
        LEA DX, break
        INT 21H
        
        CMP custloginactive, 0
        JE back2
        
        LEA DX, foodorder
        INT 21H
        
        LEA DX, goback
        INT 21H
        
        LEA DX, break
        INT 21H
        
        JMP inp5
        
        back2:
        CMP adloginactive, 1
        JE skip2
        
        LEA DX, cmt2
        CALL print
        LEA DX, break
        CALL print
        
        skip2:
        LEA DX, goback
        CALL print
        
        LEA DX, break
        CALL print
        
        inp5:
        LEA DX, input
        CALL print
        
        MOV AH, 1
        INT 21H
        
        CMP AL, 08H
        JE start
        
        CMP custloginactive, 0
        JE inp6
        
        CMP AL, 31H
        JE order1
        
        CMP AL, 32H
        JE order2
        
        CMP AL, 33H
        JE order3
        
        CMP AL, 34H
        JE order4
        
        CMP AL, 35H
        JE order5
        
        CMP AL, 36H
        JE order6
        
        CMP AL, 37H
        JE order7
        
        CMP AL, 08H
        JE start
        
        
        inp6:
        LEA DX, break
        CALL print
        
        LEA DX, validinput
        CALL print
        
        MOV AH, 1
        INT 21H
        
        CMP AL, 08H
        JE start
        
        Loop inp6
        
        
        order1:
        LEA DX, break
        CALL print
        
        LEA DX, ordereditem
        CALL print
        LEA DX, break
        CALL print
        LEA DX, f1
        CALL print
        
        LEA DX, break
        CALL print
        
        LEA DX, billstring
        CALL print
        
        ADD bill, 100
        MOV BH, 10
        
        MOV AX, bill
        
        DIV BH
        
        CMP AL, 10
        JGE div1
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        div1:
        MOV CH, AH
        
        DIV BH
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        MOV DL, CH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        
        order2:
        LEA DX, break
        CALL print
        
        LEA DX, ordereditem
        CALL print
        LEA DX, break
        CALL print
        LEA DX, f2
        CALL print
        
        LEA DX, break
        CALL print
        
        LEA DX, billstring
        CALL print
        
        ADD bill, 200
        MOV BH, 10
        
        MOV AX, bill
        
        DIV BH
        
        CMP AL, 10
        JGE div2
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        div2:
        MOV CH, AH
        
        DIV BH
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        MOV DL, CH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        
        order3:
        LEA DX, break
        CALL print
        
        LEA DX, ordereditem
        CALL print
        LEA DX, break
        CALL print
        LEA DX, f3
        CALL print
        
        LEA DX, break
        CALL print
        
        LEA DX, billstring
        CALL print
        
        ADD bill, 90
        MOV BH, 10
        
        MOV AX, bill
        
        DIV BH
        
        CMP AL, 10
        JGE div3
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        div3:
        MOV CH, AH
        
        DIV BH
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        MOV DL, CH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        order4:
        LEA DX, break
        CALL print
        
        LEA DX, ordereditem
        CALL print
        LEA DX, break
        CALL print
        LEA DX, f4
        CALL print
        
        LEA DX, break
        CALL print
        
        LEA DX, billstring
        CALL print
        
        ADD bill, 50
        MOV BH, 10
        
        MOV AX, bill
        
        DIV BH
        
        CMP AL, 10
        JGE div4
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        div4:
        MOV CH, AH
        
        DIV BH
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        MOV DL, CH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        
        order5:
        LEA DX, break
        CALL print
        
        LEA DX, ordereditem
        CALL print
        LEA DX, break
        CALL print
        LEA DX, f5
        CALL print
        
        LEA DX, break
        CALL print
        
        LEA DX, billstring
        CALL print
        
        ADD bill, 60
        MOV BH, 10
        
        MOV AX, bill
        
        DIV BH
        
        CMP AL, 10
        JGE div5
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        div5:
        MOV CH, AH
        
        DIV BH
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        MOV DL, CH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        order6:
        LEA DX, break
        CALL print
        
        LEA DX, ordereditem
        CALL print
        LEA DX, break
        CALL print
        LEA DX, f6
        CALL print
        
        LEA DX, break
        CALL print
        
        LEA DX, billstring
        CALL print
        
        ADD bill, 50
        MOV BH, 10
        
        MOV AX, bill
        
        DIV BH
        
        CMP AL, 10
        JGE div6
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        
        div6:
        MOV CH, AH
        
        DIV BH
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        MOV DL, CH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        order7:
        LEA DX, break
        CALL print
        
        LEA DX, ordereditem
        CALL print
        LEA DX, break
        CALL print
        LEA DX, f7
        CALL print
        
        LEA DX, break
        CALL print
        
        LEA DX, billstring
        CALL print
        
        ADD bill, 80
        MOV BH, 10
        
        MOV AX, bill
        
        DIV BH
        
        CMP AL, 10
        JGE div7
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        div7:
        MOV CH, AH
        
        DIV BH
        
        MOV BX, AX
        
        MOV DL, BL
        ADD DL, 30H
        CALL printc
        MOV DL, BH
        ADD DL, 30H
        CALL printc
        MOV DL, CH
        ADD DL, 30H
        CALL printc
        
        JMP fooddtls
        
        
        ; ROOM BOOKINGS RECORD
        bookings:
        CMP custloginactive, 1
        JE roomserv
        
        LEA DX, break
        CALL print
        LEA DX, prembook
        CALL print
        LEA DX, break
        CALL print
        
        LEA DX, luxbook
        CALL print
        LEA DX, break
        CALL print
        
        LEA DX, vipbook
        CALL print
        LEA DX, break
        CALL print
        CALL print
        
        LEA DX, goback
        CALL print
        LEA DX, break
        CALL print
        LEA DX, input
        CALL print
        
        MOV AH, 1
        INT 21H
        
        CMP AL, 08H
        JE start
        
        SUB AL, 30H
        CMP AL, 1
        JE viewprem
        
        CMP AL, 2
        JE viewlux
        
        CMP AL, 3
        JE viewvip
        
        JMP inp4
        
        
        viewprem:
        LEA DX, break
        CALL print
        LEA DX, prem
        CALL print
        
        MOV SI, 0
        
        out1:
        MOV BH, r1bookers[SI]
        
        CMP BH, " "
        JE check7
        
        booknum1:
        INC bookpointer1
        
        LEA DX, blank
        CALL print
        
        MOV DL, bookpointer1
        ADD DL, 30H
        CALL printc
        MOV DL, 2EH
        CALL printc
        MOV DL, 20H
        CALL printc
        
        bookername1:
        MOV BH, r1bookers[SI]
        MOV DL, BH
        CALL printc
        
        INC SI
        
        CMP r1bookers[SI], " "
        JE bookings
        
        CMP r1bookers[SI], "/"
        JE incsi1
        
        Loop bookername1
        
        incsi1:
        INC SI
        
        CMP r1bookers[SI], " "
        JE bookings
        
        JMP booknum1
        
        
        check7:
        CMP SI, 0
        JNE bookername1
        
        LEA DX, nobooks
        CALL print
        
        JMP bookings
        
        
        viewlux:
        LEA DX, break
        CALL print
        LEA DX, lux
        CALL print
        
        MOV SI, 0
        
        out2:
        MOV BH, r2bookers[SI]
        
        CMP BH, " "
        JE check8
        
        booknum2:
        INC bookpointer2
        
        LEA DX, blank
        CALL print
        
        MOV DL, bookpointer2
        ADD DL, 30H
        CALL printc
        MOV DL, 2EH
        CALL printc
        MOV DL, 20H
        CALL printc
        
        bookername2:
        MOV BH, r2bookers[SI]
        MOV DL, BH
        CALL printc
        
        INC SI
        
        CMP r2bookers[SI], " "
        JE bookings
        
        CMP r2bookers[SI], "/"
        JE incsi2
        
        Loop bookername2
        
        incsi2:
        INC SI
        
        CMP r2bookers[SI], " "
        JE bookings
        
        JMP booknum2
        
        
        check8:
        CMP SI, 0
        JNE bookername2
        
        LEA DX, nobooks
        CALL print
        
        JMP bookings
        
        
        viewvip:
        LEA DX, break
        CALL print
        LEA DX, vip
        CALL print
        
        MOV SI, 0
        
        out3:
        MOV BH, r3bookers[SI]
        
        CMP BH, " "
        JE check9
        
        booknum3:
        INC bookpointer3
        
        LEA DX, blank
        CALL print
        
        MOV DL, bookpointer3
        ADD DL, 30H
        CALL printc
        MOV DL, 2EH
        CALL printc
        MOV DL, 20H
        CALL printc
        
        bookername3:
        MOV BH, r3bookers[SI]
        MOV DL, BH
        CALL printc
        
        INC SI
        
        CMP r3bookers[SI], " "
        JE bookings
        
        CMP r3bookers[SI], "/"
        JE incsi3
        
        Loop bookername3
        
        incsi3:
        INC SI
        
        CMP r3bookers[SI], " "
        JE bookings
        
        JMP booknum3
        
        
        check9:
        CMP SI, 0
        JNE bookername3
        
        LEA DX, nobooks
        CALL print
        
        JMP bookings
        
        
        ; PRINT ROOM SERVICE DETAILS
        roomserv:
        LEA DX, break
        CALL print
        INT 21H
        
        LEA DX, roomserheader
        CALL print
        LEA DX, break
        CALL print
        LEA DX, rs1
        CALL print
        LEA DX, rs2
        CALL print
        LEA DX, rs3 
        CALL print
        LEA DX, rs4 
        CALL print  
        
        LEA DX, break
        INT 21H
        
        
        LEA DX, goback
        INT 21H
        
        
        ;INPUT FOR ROOM SERVICE
        inp7:
        LEA DX, break
        CALL print
        LEA DX, input
        CALL print
        
        MOV AH, 1
        INT 21H
        
        CMP AL, 31H
        JE rooms
        
        CMP AL, 32H
        JE rooms
        
        CMP AL, 33H
        JE rooms
        
        CMP AL, 34H
        JE rooms
        
        CMP AL, 08H
        JE start 
        
        LEA DX, wronginput
        CALL print
        
        Loop inp7
        
        rooms:
        LEA DX,break
        CALL print
        INT 21h
        
        LEA DX, complain
        CALL print
        
        LEA DX, break
        CALL print
        
        JMP roomserv
        
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H 
        
    MAIN ENDP 
        print PROC
        MOV AH, 09H
        INT 21H
        RET
        print ENDP
        
        printc PROC
        MOV AH, 02H
        INT 21H
        RET
        printc ENDP
        
        
    END MAIN                           printc ENDP
        
        
    END MAIN                    END MAIN                           printc ENDP
        
        
    END MAIN                   AIN                           printc ENDP
        
        
    END MAIN                     