_handle = CreateDialog "GJoiner";
Hint "Clique sobre o nome do pelotão que você deseja participar";
sleep 1;

While {dialog} do {

[] spawn Group_LB_Refresh;
sleep 0.1;
};