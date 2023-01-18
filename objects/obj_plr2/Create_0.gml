moveSpeed = 6;
horizontalSpeed = 0;
verticalSpeed = 0;
grv = 0.5;
itemCarrying = noone;

// These help figure out what sprites we want via state and direction
dir = 1;
plrState = plr1State.idle;

#region Arrays
// Idle
plrSpr[plr2State.idle][0] = spr_plr2_idle_front;
plrSpr[plr2State.idle][1] = spr_plr2_idle_right;
plrSpr[plr2State.idle][2] = spr_plr2_idle_left;
plrSpr[plr2State.idle][3] = spr_plr2_idle_back;

// Walking
plrSpr[plr2State.walking][1] = spr_plr2_walk_right;
plrSpr[plr2State.walking][2] = spr_plr2_walk_left;

// Jumping
plrSpr[plr2State.jumping][1] = spr_plr2_jump_right;
plrSpr[plr2State.jumping][2] = spr_plr2_jump_left;

// Pushing
plrSpr[plr2State.pushing][1] = spr_plr2_push_right;
plrSpr[plr2State.pushing][2] = spr_plr2_push_left;

// Action
plrSpr[plr2State.action][1] = spr_plr2_action_right;
plrSpr[plr2State.action][2] = spr_plr2_action_left;

// Spin
plrSpr[plr2State.spin][0] = spr_plr2_spin;

#endregion