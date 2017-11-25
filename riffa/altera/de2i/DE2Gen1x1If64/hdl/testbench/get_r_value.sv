module get_r_value (
	input signed  [31:0] S,
	output logic signed [31:0] R
);


/*LOOK-UP TABLE to get the R Value*/
always_comb begin
	case (S) 
		-438: begin 
		 R = 1;
		end
		-436: begin 
		 R = 1;
		end
		-434: begin 
		 R = 1;
		end
		-432: begin 
		 R = 1;
		end
		-430: begin 
		 R = 1;
		end
		-428: begin 
		 R = 1;
		end
		-426: begin 
		 R = 1;
		end
		-424: begin 
		 R = 1;
		end
		-422: begin 
		 R = 1;
		end
		-420: begin 
		 R = 1;
		end
		-418: begin 
		 R = 2;
		end
		-416: begin 
		 R = 2;
		end
		-414: begin 
		 R = 2;
		end
		-412: begin 
		 R = 2;
		end
		-410: begin 
		 R = 2;
		end
		-408: begin 
		 R = 2;
		end
		-406: begin 
		 R = 3;
		end
		-404: begin 
		 R = 3;
		end
		-402: begin 
		 R = 3;
		end
		-400: begin 
		 R = 3;
		end
		-398: begin 
		 R = 3;
		end
		-396: begin 
		 R = 3;
		end
		-394: begin 
		 R = 4;
		end
		-392: begin 
		 R = 4;
		end
		-390: begin 
		 R = 4;
		end
		-388: begin 
		 R = 4;
		end
		-386: begin 
		 R = 5;
		end
		-384: begin 
		 R = 5;
		end
		-382: begin 
		 R = 5;
		end
		-380: begin 
		 R = 5;
		end
		-378: begin 
		 R = 6;
		end
		-376: begin 
		 R = 6;
		end
		-374: begin 
		 R = 6;
		end
		-372: begin 
		 R = 6;
		end
		-370: begin 
		 R = 7;
		end
		-368: begin 
		 R = 7;
		end
		-366: begin 
		 R = 7;
		end
		-364: begin 
		 R = 8;
		end
		-362: begin 
		 R = 8;
		end
		-360: begin 
		 R = 8;
		end
		-358: begin 
		 R = 9;
		end
		-356: begin 
		 R = 9;
		end
		-354: begin 
		 R = 10;
		end
		-352: begin 
		 R = 10;
		end
		-350: begin 
		 R = 10;
		end
		-348: begin 
		 R = 11;
		end
		-346: begin 
		 R = 11;
		end
		-344: begin 
		 R = 12;
		end
		-342: begin 
		 R = 12;
		end
		-340: begin 
		 R = 12;
		end
		-338: begin 
		 R = 13;
		end
		-336: begin 
		 R = 13;
		end
		-334: begin 
		 R = 14;
		end
		-332: begin 
		 R = 14;
		end
		-330: begin 
		 R = 15;
		end
		-328: begin 
		 R = 15;
		end
		-326: begin 
		 R = 16;
		end
		-324: begin 
		 R = 16;
		end
		-322: begin 
		 R = 17;
		end
		-320: begin 
		 R = 18;
		end
		-318: begin 
		 R = 18;
		end
		-316: begin 
		 R = 19;
		end
		-314: begin 
		 R = 19;
		end
		-312: begin 
		 R = 20;
		end
		-310: begin 
		 R = 20;
		end
		-308: begin 
		 R = 21;
		end
		-306: begin 
		 R = 22;
		end
		-304: begin 
		 R = 22;
		end
		-302: begin 
		 R = 23;
		end
		-300: begin 
		 R = 24;
		end
		-298: begin 
		 R = 24;
		end
		-296: begin 
		 R = 25;
		end
		-294: begin 
		 R = 26;
		end
		-292: begin 
		 R = 27;
		end
		-290: begin 
		 R = 27;
		end
		-288: begin 
		 R = 28;
		end
		-286: begin 
		 R = 29;
		end
		-284: begin 
		 R = 30;
		end
		-282: begin 
		 R = 30;
		end
		-280: begin 
		 R = 31;
		end
		-278: begin 
		 R = 32;
		end
		-276: begin 
		 R = 33;
		end
		-274: begin 
		 R = 34;
		end
		-272: begin 
		 R = 35;
		end
		-270: begin 
		 R = 36;
		end
		-268: begin 
		 R = 36;
		end
		-266: begin 
		 R = 37;
		end
		-264: begin 
		 R = 38;
		end
		-262: begin 
		 R = 39;
		end
		-260: begin 
		 R = 40;
		end
		-258: begin 
		 R = 41;
		end
		-256: begin 
		 R = 42;
		end
		-254: begin 
		 R = 43;
		end
		-252: begin 
		 R = 44;
		end
		-250: begin 
		 R = 45;
		end
		-248: begin 
		 R = 46;
		end
		-246: begin 
		 R = 47;
		end
		-244: begin 
		 R = 48;
		end
		-242: begin 
		 R = 50;
		end
		-240: begin 
		 R = 51;
		end
		-238: begin 
		 R = 52;
		end
		-236: begin 
		 R = 53;
		end
		-234: begin 
		 R = 54;
		end
		-232: begin 
		 R = 55;
		end
		-230: begin 
		 R = 56;
		end
		-228: begin 
		 R = 58;
		end
		-226: begin 
		 R = 59;
		end
		-224: begin 
		 R = 60;
		end
		-222: begin 
		 R = 61;
		end
		-220: begin 
		 R = 62;
		end
		-218: begin 
		 R = 64;
		end
		-216: begin 
		 R = 65;
		end
		-214: begin 
		 R = 66;
		end
		-212: begin 
		 R = 67;
		end
		-210: begin 
		 R = 69;
		end
		-208: begin 
		 R = 70;
		end
		-206: begin 
		 R = 71;
		end
		-204: begin 
		 R = 72;
		end
		-202: begin 
		 R = 74;
		end
		-200: begin 
		 R = 75;
		end
		-198: begin 
		 R = 76;
		end
		-196: begin 
		 R = 78;
		end
		-194: begin 
		 R = 79;
		end
		-192: begin 
		 R = 80;
		end
		-190: begin 
		 R = 81;
		end
		-188: begin 
		 R = 83;
		end
		-186: begin 
		 R = 84;
		end
		-184: begin 
		 R = 85;
		end
		-182: begin 
		 R = 87;
		end
		-180: begin 
		 R = 88;
		end
		-178: begin 
		 R = 89;
		end
		-176: begin 
		 R = 91;
		end
		-174: begin 
		 R = 92;
		end
		-172: begin 
		 R = 93;
		end
		-170: begin 
		 R = 95;
		end
		-168: begin 
		 R = 96;
		end
		-166: begin 
		 R = 97;
		end
		-164: begin 
		 R = 99;
		end
		-162: begin 
		 R = 100;
		end
		-160: begin 
		 R = 101;
		end
		-158: begin 
		 R = 103;
		end
		-156: begin 
		 R = 104;
		end
		-154: begin 
		 R = 105;
		end
		-152: begin 
		 R = 107;
		end
		-150: begin 
		 R = 108;
		end
		-148: begin 
		 R = 109;
		end
		-146: begin 
		 R = 111;
		end
		-144: begin 
		 R = 112;
		end
		-142: begin 
		 R = 113;
		end
		-140: begin 
		 R = 115;
		end
		-138: begin 
		 R = 116;
		end
		-136: begin 
		 R = 117;
		end
		-134: begin 
		 R = 118;
		end
		-132: begin 
		 R = 120;
		end
		-130: begin 
		 R = 121;
		end
		-128: begin 
		 R = 122;
		end
		-126: begin 
		 R = 123;
		end
		-124: begin 
		 R = 125;
		end
		-122: begin 
		 R = 126;
		end
		-120: begin 
		 R = 127;
		end
		-118: begin 
		 R = 128;
		end
		-116: begin 
		 R = 130;
		end
		-114: begin 
		 R = 131;
		end
		-112: begin 
		 R = 132;
		end
		-110: begin 
		 R = 133;
		end
		-108: begin 
		 R = 134;
		end
		-106: begin 
		 R = 135;
		end
		-104: begin 
		 R = 136;
		end
		-102: begin 
		 R = 138;
		end
		-100: begin 
		 R = 139;
		end
		-98: begin 
		 R = 140;
		end
		-96: begin 
		 R = 141;
		end
		-94: begin 
		 R = 142;
		end
		-92: begin 
		 R = 143;
		end
		-90: begin 
		 R = 144;
		end
		-88: begin 
		 R = 145;
		end
		-86: begin 
		 R = 146;
		end
		-84: begin 
		 R = 147;
		end
		-82: begin 
		 R = 148;
		end
		-80: begin 
		 R = 149;
		end
		-78: begin 
		 R = 150;
		end
		-76: begin 
		 R = 151;
		end
		-74: begin 
		 R = 152;
		end
		-72: begin 
		 R = 153;
		end
		-70: begin 
		 R = 154;
		end
		-68: begin 
		 R = 155;
		end
		-66: begin 
		 R = 155;
		end
		-64: begin 
		 R = 156;
		end
		-62: begin 
		 R = 157;
		end
		-60: begin 
		 R = 158;
		end
		-58: begin 
		 R = 159;
		end
		-56: begin 
		 R = 159;
		end
		-54: begin 
		 R = 160;
		end
		-52: begin 
		 R = 161;
		end
		-50: begin 
		 R = 161;
		end
		-48: begin 
		 R = 162;
		end
		-46: begin 
		 R = 163;
		end
		-44: begin 
		 R = 163;
		end
		-42: begin 
		 R = 164;
		end
		-40: begin 
		 R = 164;
		end
		-38: begin 
		 R = 165;
		end
		-36: begin 
		 R = 165;
		end
		-34: begin 
		 R = 166;
		end
		-32: begin 
		 R = 166;
		end
		-30: begin 
		 R = 167;
		end
		-28: begin 
		 R = 167;
		end
		-26: begin 
		 R = 168;
		end
		-24: begin 
		 R = 168;
		end
		-22: begin 
		 R = 168;
		end
		-20: begin 
		 R = 169;
		end
		-18: begin 
		 R = 169;
		end
		-16: begin 
		 R = 169;
		end
		-14: begin 
		 R = 169;
		end
		-12: begin 
		 R = 170;
		end
		-10: begin 
		 R = 170;
		end
		-8: begin 
		 R = 170;
		end
		-6: begin 
		 R = 170;
		end
		-4: begin 
		 R = 170;
		end
		-2: begin 
		 R = 170;
		end
		32'd0: begin 
		 R = 170;
		end
		32'd2: begin 
		 R = 170;
		end
		32'd4: begin 
		 R = 170;
		end
		32'd6: begin 
		 R = 170;
		end
		32'd8: begin 
		 R = 170;
		end
		32'd10: begin 
		 R = 170;
		end
		32'd12: begin 
		 R = 170;
		end
		32'd14: begin 
		 R = 169;
		end
		32'd16: begin 
		 R = 169;
		end
		32'd18: begin 
		 R = 169;
		end
		32'd20: begin 
		 R = 169;
		end
		32'd22: begin 
		 R = 168;
		end
		32'd24: begin 
		 R = 168;
		end
		32'd26: begin 
		 R = 168;
		end
		32'd28: begin 
		 R = 167;
		end
		32'd30: begin 
		 R = 167;
		end
		32'd32: begin 
		 R = 166;
		end
		32'd34: begin 
		 R = 166;
		end
		32'd36: begin 
		 R = 165;
		end
		32'd38: begin 
		 R = 165;
		end
		32'd40: begin 
		 R = 164;
		end
		32'd42: begin 
		 R = 164;
		end
		32'd44: begin 
		 R = 163;
		end
		32'd46: begin 
		 R = 163;
		end
		32'd48: begin 
		 R = 162;
		end
		32'd50: begin 
		 R = 161;
		end
		32'd52: begin 
		 R = 161;
		end
		32'd54: begin 
		 R = 160;
		end
		32'd56: begin 
		 R = 159;
		end
		32'd58: begin 
		 R = 159;
		end
		32'd60: begin 
		 R = 158;
		end
		32'd62: begin 
		 R = 157;
		end
		32'd64: begin 
		 R = 156;
		end
		32'd66: begin 
		 R = 155;
		end
		32'd68: begin 
		 R = 155;
		end
		32'd70: begin 
		 R = 154;
		end
		32'd72: begin 
		 R = 153;
		end
		32'd74: begin 
		 R = 152;
		end
		32'd76: begin 
		 R = 151;
		end
		32'd78: begin 
		 R = 150;
		end
		32'd80: begin 
		 R = 149;
		end
		32'd82: begin 
		 R = 148;
		end
		32'd84: begin 
		 R = 147;
		end
		32'd86: begin 
		 R = 146;
		end
		32'd88: begin 
		 R = 145;
		end
		32'd90: begin 
		 R = 144;
		end
		32'd92: begin 
		 R = 143;
		end
		32'd94: begin 
		 R = 142;
		end
		32'd96: begin 
		 R = 141;
		end
		32'd98: begin 
		 R = 140;
		end
		32'd100: begin 
		 R = 139;
		end
		32'd102: begin 
		 R = 138;
		end
		32'd104: begin 
		 R = 136;
		end
		32'd106: begin 
		 R = 135;
		end
		32'd108: begin 
		 R = 134;
		end
		32'd110: begin 
		 R = 133;
		end
		32'd112: begin 
		 R = 132;
		end
		32'd114: begin 
		 R = 131;
		end
		32'd116: begin 
		 R = 130;
		end
		32'd118: begin 
		 R = 128;
		end
		32'd120: begin 
		 R = 127;
		end
		32'd122: begin 
		 R = 126;
		end
		32'd124: begin 
		 R = 125;
		end
		32'd126: begin 
		 R = 123;
		end
		32'd128: begin 
		 R = 122;
		end
		32'd130: begin 
		 R = 121;
		end
		32'd132: begin 
		 R = 120;
		end
		32'd134: begin 
		 R = 118;
		end
		32'd136: begin 
		 R = 117;
		end
		32'd138: begin 
		 R = 116;
		end
		32'd140: begin 
		 R = 115;
		end
		32'd142: begin 
		 R = 113;
		end
		32'd144: begin 
		 R = 112;
		end
		32'd146: begin 
		 R = 111;
		end
		32'd148: begin 
		 R = 109;
		end
		32'd150: begin 
		 R = 108;
		end
		32'd152: begin 
		 R = 107;
		end
		32'd154: begin 
		 R = 105;
		end
		32'd156: begin 
		 R = 104;
		end
		32'd158: begin 
		 R = 103;
		end
		32'd160: begin 
		 R = 101;
		end
		32'd162: begin 
		 R = 100;
		end
		32'd164: begin 
		 R = 99;
		end
		32'd166: begin 
		 R = 97;
		end
		32'd168: begin 
		 R = 96;
		end
		32'd170: begin 
		 R = 95;
		end
		32'd172: begin 
		 R = 93;
		end
		32'd174: begin 
		 R = 92;
		end
		32'd176: begin 
		 R = 91;
		end
		32'd178: begin 
		 R = 89;
		end
		32'd180: begin 
		 R = 88;
		end
		32'd182: begin 
		 R = 87;
		end
		32'd184: begin 
		 R = 85;
		end
		32'd186: begin 
		 R = 84;
		end
		32'd188: begin 
		 R = 83;
		end
		32'd190: begin 
		 R = 81;
		end
		32'd192: begin 
		 R = 80;
		end
		32'd194: begin 
		 R = 79;
		end
		32'd196: begin 
		 R = 78;
		end
		32'd198: begin 
		 R = 76;
		end
		32'd200: begin 
		 R = 75;
		end
		32'd202: begin 
		 R = 74;
		end
		32'd204: begin 
		 R = 72;
		end
		32'd206: begin 
		 R = 71;
		end
		32'd208: begin 
		 R = 70;
		end
		32'd210: begin 
		 R = 69;
		end
		32'd212: begin 
		 R = 67;
		end
		32'd214: begin 
		 R = 66;
		end
		32'd216: begin 
		 R = 65;
		end
		32'd218: begin 
		 R = 64;
		end
		32'd220: begin 
		 R = 62;
		end
		32'd222: begin 
		 R = 61;
		end
		32'd224: begin 
		 R = 60;
		end
		32'd226: begin 
		 R = 59;
		end
		32'd228: begin 
		 R = 58;
		end
		32'd230: begin 
		 R = 56;
		end
		32'd232: begin 
		 R = 55;
		end
		32'd234: begin 
		 R = 54;
		end
		32'd236: begin 
		 R = 53;
		end
		32'd238: begin 
		 R = 52;
		end
		32'd240: begin 
		 R = 51;
		end
		32'd242: begin 
		 R = 50;
		end
		32'd244: begin 
		 R = 48;
		end
		32'd246: begin 
		 R = 47;
		end
		32'd248: begin 
		 R = 46;
		end
		32'd250: begin 
		 R = 45;
		end
		32'd252: begin 
		 R = 44;
		end
		32'd254: begin 
		 R = 43;
		end
		32'd256: begin 
		 R = 42;
		end
		32'd258: begin 
		 R = 41;
		end
		32'd260: begin 
		 R = 40;
		end
		32'd262: begin 
		 R = 39;
		end
		32'd264: begin 
		 R = 38;
		end
		32'd266: begin 
		 R = 37;
		end
		32'd268: begin 
		 R = 36;
		end
		32'd270: begin 
		 R = 36;
		end
		32'd272: begin 
		 R = 35;
		end
		32'd274: begin 
		 R = 34;
		end
		32'd276: begin 
		 R = 33;
		end
		32'd278: begin 
		 R = 32;
		end
		32'd280: begin 
		 R = 31;
		end
		32'd282: begin 
		 R = 30;
		end
		32'd284: begin 
		 R = 30;
		end
		32'd286: begin 
		 R = 29;
		end
		32'd288: begin 
		 R = 28;
		end
		32'd290: begin 
		 R = 27;
		end
		32'd292: begin 
		 R = 27;
		end
		32'd294: begin 
		 R = 26;
		end
		32'd296: begin 
		 R = 25;
		end
		32'd298: begin 
		 R = 24;
		end
		32'd300: begin 
		 R = 24;
		end
		32'd302: begin 
		 R = 23;
		end
		32'd304: begin 
		 R = 22;
		end
		32'd306: begin 
		 R = 22;
		end
		32'd308: begin 
		 R = 21;
		end
		32'd310: begin 
		 R = 20;
		end
		32'd312: begin 
		 R = 20;
		end
		32'd314: begin 
		 R = 19;
		end
		32'd316: begin 
		 R = 19;
		end
		32'd318: begin 
		 R = 18;
		end
		32'd320: begin 
		 R = 18;
		end
		32'd322: begin 
		 R = 17;
		end
		32'd324: begin 
		 R = 16;
		end
		32'd326: begin 
		 R = 16;
		end
		32'd328: begin 
		 R = 15;
		end
		32'd330: begin 
		 R = 15;
		end
		32'd332: begin 
		 R = 14;
		end
		32'd334: begin 
		 R = 14;
		end
		32'd336: begin 
		 R = 13;
		end
		32'd338: begin 
		 R = 13;
		end
		32'd340: begin 
		 R = 12;
		end
		32'd342: begin 
		 R = 12;
		end
		32'd344: begin 
		 R = 12;
		end
		32'd346: begin 
		 R = 11;
		end
		32'd348: begin 
		 R = 11;
		end
		32'd350: begin 
		 R = 10;
		end
		32'd352: begin 
		 R = 10;
		end
		32'd354: begin 
		 R = 10;
		end
		32'd356: begin 
		 R = 9;
		end
		32'd358: begin 
		 R = 9;
		end
		32'd360: begin 
		 R = 8;
		end
		32'd362: begin 
		 R = 8;
		end
		32'd364: begin 
		 R = 8;
		end
		32'd366: begin 
		 R = 7;
		end
		32'd368: begin 
		 R = 7;
		end
		32'd370: begin 
		 R = 7;
		end
		32'd372: begin 
		 R = 6;
		end
		32'd374: begin 
		 R = 6;
		end
		32'd376: begin 
		 R = 6;
		end
		32'd378: begin 
		 R = 6;
		end
		32'd380: begin 
		 R = 5;
		end
		32'd382: begin 
		 R = 5;
		end
		32'd384: begin 
		 R = 5;
		end
		32'd386: begin 
		 R = 5;
		end
		32'd388: begin 
		 R = 4;
		end
		32'd390: begin 
		 R = 4;
		end
		32'd392: begin 
		 R = 4;
		end
		32'd394: begin 
		 R = 4;
		end
		32'd396: begin 
		 R = 3;
		end
		32'd398: begin 
		 R = 3;
		end
		32'd400: begin 
		 R = 3;
		end
		32'd402: begin 
		 R = 3;
		end
		32'd404: begin 
		 R = 3;
		end
		32'd406: begin 
		 R = 3;
		end
		32'd408: begin 
		 R = 2;
		end
		32'd410: begin 
		 R = 2;
		end
		32'd412: begin 
		 R = 2;
		end
		32'd414: begin 
		 R = 2;
		end
		32'd416: begin 
		 R = 2;
		end
		32'd418: begin 
		 R = 2;
		end
		32'd420: begin 
		 R = 1;
		end
		32'd422: begin 
		 R = 1;
		end
		32'd424: begin 
		 R = 1;
		end
		32'd426: begin 
		 R = 1;
		end
		32'd428: begin 
		 R = 1;
		end
		32'd430: begin 
		 R = 1;
		end
		32'd432: begin 
		 R = 1;
		end
		32'd434: begin 
		 R = 1;
		end
		32'd436: begin 
		 R = 1;
		end
		32'd438: begin 
		 R = 1;
		end							
		default begin
			R = 0;
		end
	endcase
	end
endmodule 