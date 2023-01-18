moveSpeed = 5.5;
horizontalSpeed = 0;
verticalSpeed = 0;
grv = 0.5;
global.carryingP2 = false;
itemCarrying = noone;
pauseFrame = false;

// These help figure out what sprites we want via state and direction
/*
0 = front
1 = right
2 = left
3 = back
*/
dir = 1;
plrState = plr1State.idle;

#region Arrays
// Idle
plrSpr[plr1State.idle][0] = spr_plr1_idle_front;
plrSpr[plr1State.idle][1] = spr_plr1_idle_right;
plrSpr[plr1State.idle][2] = spr_plr1_idle_left;
plrSpr[plr1State.idle][3] = spr_plr1_idle_back;

// Walking
plrSpr[plr1State.walking][1] = spr_plr1_walk_right;
plrSpr[plr1State.walking][2] = spr_plr1_walk_left;

// Jumping
plrSpr[plr1State.jumping][1] = spr_plr1_jump_right;
plrSpr[plr1State.jumping][2] = spr_plr1_jump_left;

// Pushing
plrSpr[plr1State.pushing][1] = spr_plr1_push_right;
plrSpr[plr1State.pushing][2] = spr_plr1_push_left;

// Action
plrSpr[plr1State.action][1] = spr_plr1_action_right;
plrSpr[plr1State.action][2] = spr_plr1_action_left;

// Spin
plrSpr[plr1State.spin][0] = spr_plr1_spin;

#endregion