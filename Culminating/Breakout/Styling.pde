//Castle

int[][] castleGrid = {

{20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20},
{6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6},
{5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5},
{20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20},
{3,3,3,3,3,3,3,3,3,3,3,3,100,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,100,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,100,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
};

Square[] castle = new Square[castleGrid[0].length * castleGrid.length];

//Coloring
color antiqueWhite = color(238,228,218);
color bisque = color(237,224,200);
color lightsalmon = color(242,177,121);
color sandybrown = color(245,149,99);
color coral = color(246,124,95);
color tomato = color(246,94,59);
color burlywood = color(237,207,114);
color black = color(0);
void switchColor(int variable){
        switch(variable){
            case 1: fill(antiqueWhite); break;
            case 2: fill(bisque); break;
            case 3: fill(lightsalmon); break;
            case 4: fill(sandybrown); break;
            case 5: fill(coral); break;
            case 6: fill(tomato); break;
            case 7: fill(burlywood); break;
        }
        if(variable > 7) fill(black);
}

//notify
void notify(){
    fill(255,0,0);
    recT(0,0,width,height);
}
