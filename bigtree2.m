clear all;
clc;



%%%%%%%%%%%%%%%%%%%%%%--------getting training data--------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
optdigit_tra = importdata('optdigits.tra');
[a,b] = size(optdigit_tra);

num0 = 1;
num1 = 1;
num2 = 1;
num3 = 1;
num4 = 1;
num5 = 1;
num6 = 1;
num7 = 1;
num8 = 1;
num9 = 1;






for i = 1 : a
    if optdigit_tra(i,b) == 0
        digit_0(num0,:) = optdigit_tra(i,1:(b-1));
        num0 = num0 + 1;
    elseif optdigit_tra(i,b) == 1
        digit_1(num1,:) = optdigit_tra(i,1:(b-1));
        num1 = num1 + 1;
    elseif optdigit_tra(i,b) == 2
        digit_2(num2,:) = optdigit_tra(i,1:(b-1));
        num2 = num2 + 1;
    elseif optdigit_tra(i,b) == 3
        digit_3(num3,:) = optdigit_tra(i,1:(b-1));
        num3 = num3 + 1;
    elseif optdigit_tra(i,b) == 4
        digit_4(num4,:) = optdigit_tra(i,1:(b-1));
        num4 = num4 + 1;
    elseif optdigit_tra(i,b) == 5
        digit_5(num5,:) = optdigit_tra(i,1:(b-1));
        num5 = num5 + 1;
    elseif optdigit_tra(i,b) == 6
        digit_6(num6,:) = optdigit_tra(i,1:(b-1));
        num6 = num6 + 1;
    elseif optdigit_tra(i,b) == 7
        digit_7(num7,:) = optdigit_tra(i,1:(b-1)); 
        num7 = num7 + 1;
    elseif optdigit_tra(i,b) == 8
        digit_8(num8,:) = optdigit_tra(i,1:(b-1));
        num8 = num8 + 1;
    elseif optdigit_tra(i,b) == 9
        digit_9(num9,:) = optdigit_tra(i,1:(b-1)); 
        num9 = num9 + 1;

    end
end






for i=1:370
    
    tra_group((i-1)*10 + 1,:) = digit_0(i,:);
    tra_group((i-1)*10 + 2,:) = digit_1(i,:);
    tra_group((i-1)*10 + 3,:) = digit_2(i,:);
    tra_group((i-1)*10 + 4,:) = digit_3(i,:);
    tra_group((i-1)*10 + 5,:) = digit_4(i,:);
    tra_group((i-1)*10 + 6,:) = digit_5(i,:);
    tra_group((i-1)*10 + 7,:) = digit_6(i,:);
    tra_group((i-1)*10 + 8,:) = digit_7(i,:);
    tra_group((i-1)*10 + 9,:) = digit_8(i,:);
    tra_group((i-1)*10 + 10,:) = digit_9(i,:);
end













%%%%%%%%%%%%%%%%%%%%%%----------getting testing data-------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


optdigit_tes = importdata('optdigits.tes');
[c,d] = size(optdigit_tes);

num0 = 1;
num1 = 1;
num2 = 1;
num3 = 1;
num4 = 1;
num5 = 1;
num6 = 1;
num7 = 1;
num8 = 1;
num9 = 1;






for i = 1 : c
    if optdigit_tes(i,d) == 0
        tes_digit_0(num0,:) = optdigit_tes(i,1:(d-1));
        num0 = num0 + 1;
    elseif optdigit_tes(i,d) == 1
        tes_digit_1(num1,:) = optdigit_tes(i,1:(d-1));
        num1 = num1 + 1;
    elseif optdigit_tes(i,d) == 2
        tes_digit_2(num2,:) = optdigit_tes(i,1:(d-1));
        num2 = num2 + 1;
    elseif optdigit_tes(i,d) == 3
        tes_digit_3(num3,:) = optdigit_tes(i,1:(d-1));
        num3 = num3 + 1;
    elseif optdigit_tes(i,d) == 4
        tes_digit_4(num4,:) = optdigit_tes(i,1:(d-1));
        num4 = num4 + 1;
    elseif optdigit_tes(i,d) == 5
        tes_digit_5(num5,:) = optdigit_tes(i,1:(d-1));
        num5 = num5 + 1;
    elseif optdigit_tes(i,d) == 6
        tes_digit_6(num6,:) = optdigit_tes(i,1:(d-1));
        num6 = num6 + 1;
    elseif optdigit_tes(i,d) == 7
        tes_digit_7(num7,:) = optdigit_tes(i,1:(d-1)); 
        num7 = num7 + 1;
    elseif optdigit_tes(i,d) == 8
        tes_digit_8(num8,:) = optdigit_tes(i,1:(d-1));
        num8 = num8 + 1;
    elseif optdigit_tes(i,d) == 9
        tes_digit_9(num9,:) = optdigit_tes(i,1:(d-1)); 
        num9 = num9 + 1;

    end
end

[tes_size_0,t0] = size(tes_digit_0);
[tes_size_1,t1] = size(tes_digit_1);
[tes_size_2,t2] = size(tes_digit_2);
[tes_size_3,t3] = size(tes_digit_3);
[tes_size_4,t4] = size(tes_digit_4);
[tes_size_5,t5] = size(tes_digit_5);
[tes_size_6,t6] = size(tes_digit_6);
[tes_size_7,t7] = size(tes_digit_7);
[tes_size_8,t8] = size(tes_digit_8);
[tes_size_9,t9] = size(tes_digit_9);







%%%%%%%%%%%%%----------- building kd-tree --------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tree = kd_buildtree(tra_group,0);

%%%%%%%%%%%%%%%%%%%%%%--------knn searching-----------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tes_0_label = zeros(tes_size_0,15);
tes_1_label = zeros(tes_size_1,15);
tes_2_label = zeros(tes_size_2,15);
tes_3_label = zeros(tes_size_3,15);
tes_4_label = zeros(tes_size_4,15);
tes_5_label = zeros(tes_size_5,15);
tes_6_label = zeros(tes_size_6,15);
tes_7_label = zeros(tes_size_7,15);
tes_8_label = zeros(tes_size_8,15);
tes_9_label = zeros(tes_size_9,15);



%%%%%%%%%--------------digit0-----------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:tes_size_0
    [index_vals,vector_vals,final_node] = kd_knn(tree,tes_digit_0(j,:),15,0);
     tes_0_label(j,:) = index_vals-1;
end

for j=1:tes_size_0
    for i=1:15
        tes_0_label(j,i)=mod(tes_0_label(j,i),10);
    end
    tes_0_label(j,16)=mode(tes_0_label(j,1:15));
    if tes_0_label(j,16)==0
        tes_0_label(j,17)=1;
    else
        tes_0_label(j,17)=0;
    end
end
right_0 = sum(tes_0_label(:,17)==1);
right_rate_0 = right_0/tes_size_0;


%%%%%%%%%%----------digit1---------%%%%%%%%%%%%%%%%%%%
for j=1:tes_size_1
    [index_vals,vector_vals,final_node] = kd_knn(tree,tes_digit_1(j,:),15,0);
     tes_1_label(j,:) = index_vals-1;
end

for j=1:tes_size_1
    for i=1:15
        tes_1_label(j,i)=mod(tes_1_label(j,i),10);
    end
    tes_1_label(j,16)=mode(tes_1_label(j,1:15));
    if tes_1_label(j,16)==1
        tes_1_label(j,17)=1;
    else
        tes_1_label(j,17)=0;
    end
end
right_1 = sum(tes_1_label(:,17)==1);
right_rate_1 = right_1/tes_size_1;



%%%%%%%------------digit2------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:tes_size_2
    [index_vals,vector_vals,final_node] = kd_knn(tree,tes_digit_2(j,:),15,0);
     tes_2_label(j,:) = index_vals-1;
end

for j=1:tes_size_2
    for i=1:15
        tes_2_label(j,i)=mod(tes_2_label(j,i),10);
    end
    tes_2_label(j,16)=mode(tes_2_label(j,1:15));
    if tes_2_label(j,16)==2
        tes_2_label(j,17)=1;
    else
        tes_2_label(j,17)=0;
    end
end
right_2 = sum(tes_2_label(:,17)==1);
right_rate_2 = right_2/tes_size_2;



%%%%%%----------digit3---------%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:tes_size_3
    [index_vals,vector_vals,final_node] = kd_knn(tree,tes_digit_3(j,:),15,0);
     tes_3_label(j,:) = index_vals-1;
end

for j=1:tes_size_3
    for i=1:15
        tes_3_label(j,i)=mod(tes_3_label(j,i),10);
    end
    tes_3_label(j,16)=mode(tes_3_label(j,1:15));
    if tes_3_label(j,16)==3
        tes_3_label(j,17)=1;
    else
        tes_3_label(j,17)=0;
    end
end
right_3 = sum(tes_3_label(:,17)==1);
right_rate_3 = right_3/tes_size_3;



%%%%%%%------------digit4---------%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:tes_size_4
    [index_vals,vector_vals,final_node] = kd_knn(tree,tes_digit_4(j,:),15,0);
     tes_4_label(j,:) = index_vals-1;
end

for j=1:tes_size_4
    for i=1:15
        tes_4_label(j,i)=mod(tes_4_label(j,i),10);
    end
    tes_4_label(j,16)=mode(tes_4_label(j,1:15));
    if tes_4_label(j,16)==4
        tes_4_label(j,17)=1;
    else
        tes_4_label(j,17)=0;
    end
end
right_4 = sum(tes_4_label(:,17)==1);
right_rate_4 = right_4/tes_size_4;



%%%%%%-----------digit5------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
for j=1:tes_size_5
    [index_vals,vector_vals,final_node] = kd_knn(tree,tes_digit_5(j,:),15,0);
     tes_5_label(j,:) = index_vals-1;
end

for j=1:tes_size_5
    for i=1:15
        tes_5_label(j,i)=mod(tes_5_label(j,i),10);
    end
    tes_5_label(j,16)=mode(tes_5_label(j,1:15));
    if tes_5_label(j,16)==5
        tes_5_label(j,17)=1;
    else
        tes_5_label(j,17)=0;
    end
end
right_5 = sum(tes_5_label(:,17)==1);
right_rate_5 = right_5/tes_size_5;


%%%%%%%--------------digit6-------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:tes_size_6
    [index_vals,vector_vals,final_node] = kd_knn(tree,tes_digit_6(j,:),15,0);
     tes_6_label(j,:) = index_vals-1;
end

for j=1:tes_size_6
    for i=1:15
        tes_6_label(j,i)=mod(tes_6_label(j,i),10);
    end
    tes_6_label(j,16)=mode(tes_6_label(j,1:15));
    if tes_6_label(j,16)==6
        tes_6_label(j,17)=1;
    else
        tes_6_label(j,17)=0;
    end
end
right_6 = sum(tes_6_label(:,17)==1);
right_rate_6 = right_6/tes_size_6;


%%%%%--------------digit7-------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:tes_size_7
    [index_vals,vector_vals,final_node] = kd_knn(tree,tes_digit_7(j,:),15,0);
     tes_7_label(j,:) = index_vals-1;
end

for j=1:tes_size_7
    for i=1:15
        tes_7_label(j,i)=mod(tes_7_label(j,i),10);
    end
    tes_7_label(j,16)=mode(tes_7_label(j,1:15));
    if tes_7_label(j,16)==7
        tes_7_label(j,17)=1;
    else
        tes_7_label(j,17)=0;
    end
end
right_7 = sum(tes_7_label(:,17)==1);
right_rate_7 = right_7/tes_size_7;


%%%%%%%%-------------digit8-------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:tes_size_8
    [index_vals,vector_vals,final_node] = kd_knn(tree,tes_digit_8(j,:),15,0);
     tes_8_label(j,:) = index_vals-1;
end

for j=1:tes_size_8
    for i=1:15
        tes_8_label(j,i)=mod(tes_8_label(j,i),10);
    end
    tes_8_label(j,16)=mode(tes_8_label(j,1:15));
    if tes_8_label(j,16)==8
        tes_8_label(j,17)=1;
    else
        tes_8_label(j,17)=0;
    end
end
right_8 = sum(tes_8_label(:,17)==1);
right_rate_8 = right_8/tes_size_8;


%%%%%%---------------digit9-------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:tes_size_9
    [index_vals,vector_vals,final_node] = kd_knn(tree,tes_digit_9(j,:),15,0);
     tes_9_label(j,:) = index_vals-1;
end

for j=1:tes_size_9
    for i=1:15
        tes_9_label(j,i)=mod(tes_9_label(j,i),10);
    end
    tes_9_label(j,16)=mode(tes_9_label(j,1:15));
    if tes_9_label(j,16)==9
        tes_9_label(j,17)=1;
    else
        tes_9_label(j,17)=0;
    end
end
right_9 = sum(tes_9_label(:,17)==1);
right_rate_9 = right_9/tes_size_9;

        
        