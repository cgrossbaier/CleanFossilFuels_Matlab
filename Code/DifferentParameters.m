%DifferentParameters

Twall_in = 1800;
Tair_in = 500;
d_in = 1.0000e-04;
T_in = 300;

[time1,output1]=Parameter( Twall_in, Tair_in, d_in, T_in );

Twall_in = 1800;
Tair_in = 700;

[time2,output2]=Parameter( Twall_in, Tair_in, d_in, T_in );

plot(time1, output1(:,3),time2, output2(:,3));

