int numTeachers = 6;
Teacher[] finalTeacherList = new Teacher[numTeachers];

Teacher Agbajoh,Ally,Bamford,Boyer,Broome,Buchanan,Burgess,Cabral,Cappelina,Cha,Churchill,Colombe,Cranfield,Darroch,DeMedeiros,Debnath,Demeter,Dennis,DiFiore,Eckert,Elcombe,Elliot,Figliomeni,Gandhi,Garde,Ghorvei,Gillard,Haywood,Henshaw,Igiehon,Irvine,Janco,Kerr,Kroes,Lightbody,Mackenzie,Mahan,Mandarino,McCallum,McEwen,McInnis,Miller,Moniz, Monteiro,Morra,Nanavati,Navaro,ODonnell,Oliver,Panetta,Panico,Parmar,Parry,Patel,Pathak,Pinke,Rai,Roger,Rogers,Scopis,Seidel,Shaw,Sinclair,Smiley,Somerset,Sousa,Stockden,Tabone,Tarnowka,Tomaro,Trottier,Truscello,Walker,Whitford,WillDryden,Yearwood,Youngman,Zamora;

void teacherSetup(){
    Teacher Agbajoh    = new Teacher(3,"Agbajoh.png");
    Teacher Ally       = new Teacher(4,"Ally.png");
    Teacher Bamford    = new Teacher(5,"Bamford.png");
    Teacher Boyer      = new Teacher(3,"Boyer.png");
    Teacher Broome     = new Teacher(6,"Broome.png");
    Teacher Buchanan   = new Teacher(3,"Buchanan.png");
    Teacher Burgess    = new Teacher(8,"Burgess.png");
    Teacher Cabral     = new Teacher(9,"Cabral.png");
    Teacher Cappelina  = new Teacher(10,"Cappelina.png");
    Teacher Cha        = new Teacher(3,"Cha.png");
    Teacher Churchill  = new Teacher(12,"Churchill.png");
    Teacher Colombe    = new Teacher(11,"Colombe.png");
    Teacher Cranfield  = new Teacher(10,"Cranfield.png");
    Teacher Darroch    = new Teacher(9,"Darroch.png");
    Teacher DeMedeiros = new Teacher(8,"De Medeiros.png");
    Teacher Debnath    = new Teacher(9,"Debnath.png");
    Teacher Demeter    = new Teacher(7,"Demeter.png");
    Teacher Dennis     = new Teacher(6,"Dennis.png");
    Teacher DiFiore    = new Teacher(5,"DiFiore.png");
    Teacher Eckert     = new Teacher(3,"Eckert.png");
    Teacher Elcombe    = new Teacher(3,"Elcombe.png");
    Teacher Elliot     = new Teacher(4,"Elliot.png");
    Teacher Figliomeni = new Teacher(5,"Figliomeni.png");
    Teacher Gandhi     = new Teacher(6,"Gandhi.png");
    Teacher Garde      = new Teacher(7,"Garde.png");
    Teacher Ghorvei    = new Teacher(8,"Ghorvei.png");
    Teacher Gillard    = new Teacher(9,"Gillard.png");
    Teacher Haywood    = new Teacher(10,"Haywood.png");
    Teacher Henshaw    = new Teacher(11,"Henshaw.png");
    Teacher Igiehon    = new Teacher(12,"Igiehon.png");
    Teacher Irvine     = new Teacher(11,"Irvine.png");
    Teacher Janco      = new Teacher(3,"Janco.png");
    Teacher Kerr       = new Teacher(9,"Kerr.png");
    Teacher Kroes      = new Teacher(3,"Kroes.png");
    Teacher Lightbody  = new Teacher(8,"Lightbody.png");
    Teacher Mackenzie  = new Teacher(7,"Mackenzie.png");
    Teacher Mahan      = new Teacher(6,"Mahan.png");
    Teacher Mandarino  = new Teacher(5,"Mandarino.png");
    Teacher McCallum   = new Teacher(4,"McCallum.png");
    Teacher McEwen     = new Teacher(3,"McEwen.png");
    Teacher McInnis    = new Teacher(4,"McInnis.png");
    Teacher Miller     = new Teacher(3,"Miller.png");
    Teacher Moniz      = new Teacher(6,"Moniz.png");
    Teacher Monteiro   = new Teacher(7,"Monteiro.png");
    Teacher Morra      = new Teacher(8,"Morra.png");
    Teacher Nanavati   = new Teacher(9,"Nanavati.png");
    Teacher Navaro     = new Teacher(10,"Navaro.png");
    Teacher ODonnell   = new Teacher(11,"ODonnell.png");
    Teacher Oliver     = new Teacher(12,"Oliver.png");
    Teacher Panetta    = new Teacher(11,"Panetta.png"); //
    Teacher Panico     = new Teacher(10,"Panico.png");
    Teacher Parmar     = new Teacher(9,"Parmar.png");
    Teacher Parry      = new Teacher(8,"Parry.png");
    Teacher Patel      = new Teacher(7,"Patel.png");
    Teacher Pathak     = new Teacher(6,"Pathak.png");
    Teacher Pinke      = new Teacher(3,"Pinke.png");
    Teacher Rai        = new Teacher(5,"Rai.png");
    Teacher Roger      = new Teacher(4,"Roger.png");
    Teacher Rogers     = new Teacher(3,"Rogers.png");
    Teacher Scopis     = new Teacher(4,"Scopis.png");
    Teacher Seidel     = new Teacher(40,"Seidel.png"); // :<
    Teacher Shaw       = new Teacher(6,"Shaw.png");
    Teacher Sinclair   = new Teacher(7,"Sinclair.png");
    Teacher Smiley     = new Teacher(3,"Smiley.png");
    Teacher Somerset   = new Teacher(3,"Somerset.png");
    Teacher Sousa      = new Teacher(10,"Sousa.png");
    Teacher Stockden   = new Teacher(11,"Stockden.png");
    Teacher Tabone     = new Teacher(12,"Tabone.png");
    Teacher Tarnowka   = new Teacher(11,"Tarnowka.png");
    Teacher Tomaro     = new Teacher(10,"Tomaro.png");
    Teacher Trottier   = new Teacher(9,"Trottier.png");
    Teacher Truscello  = new Teacher(8,"Truscello.png");
    Teacher Walker     = new Teacher(7,"Walker.png");
    Teacher Whitford   = new Teacher(6,"Whitford.png");
    Teacher WillDryden = new Teacher(5,"Will-Dryden.png");
    Teacher Yearwood   = new Teacher(4,"Yearwood.png");
    Teacher Youngman   = new Teacher(5,"Youngman.png");
    Teacher Zamora     = new Teacher(6,"Zamora.png");

    Teacher[] newTeacherList = {
        Agbajoh,Ally,Bamford,Boyer,Broome,Buchanan,Burgess,Cabral,Cappelina,Cha,Churchill,Colombe,Cranfield,Darroch,DeMedeiros,Debnath,Demeter,Dennis,DiFiore,Eckert,Elcombe,Elliot,Figliomeni,Gandhi,Garde,Ghorvei,Gillard,Haywood,Henshaw,Igiehon,Irvine,Janco,Kerr,Kroes,Lightbody,Mackenzie,Mahan,Mandarino,McCallum,McEwen,McInnis,Miller,Moniz,
        Monteiro,Morra,Nanavati,Navaro,ODonnell,Oliver,Panetta,Panico,Parmar,Parry,Patel,Pathak,Pinke,Rai,Roger,Rogers,Scopis,Seidel,Shaw,Sinclair,Smiley,Somerset,Sousa,Stockden,Tabone,Tarnowka,Tomaro,Trottier,Truscello,Walker,Whitford,WillDryden,Yearwood,Youngman,Zamora
    };

    resetTeachers(newTeacherList);

}

void resetTeachers(Teacher[] newTeacherList){
    difficulty = 0;
    for(int i=0;i<numTeachers;i++){

        //Pick a random teacher
        int teacherIndex = floor(random(1,newTeacherList.length));
        finalTeacherList[i] = newTeacherList[teacherIndex];

        //Even teachers wander randomly
        if(i == 0 || i == 1 || finalTeacherList[i].imageName == "Seidel.png") finalTeacherList[i].mode = 0;

        //Sets Difficulty based off of combined slowness of chasers
        else difficulty += finalTeacherList[i].slowness;
    }

    difficulty = 48-difficulty;

}
