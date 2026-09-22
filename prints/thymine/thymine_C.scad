$fn = 100;

union() {
	cube(size = 0);
	translate(v = [0.0, 0.0, 0]) {
		translate(v = [0, 0, 6.226879485344163]) {
			rotate(a = [0, 90, 0]) {
				rotate(a = [0, -0.0115017040302349, 0]) {
					rotate(a = [0, 0, 169.369040018626]) {
						color(alpha = 1.0, c = "dimgray") {
							difference() {
								sphere(r = 14.166666666666666);
								rotate(a = [0.0, 0.0, 98.66461201078421]) {
									rotate(a = [0.0, 0.026514342029201953, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.92026161353462]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 41.33114584953808]) {
									rotate(a = [0.0, -0.02121135555253579, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.964980018643955]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -16.828490250560698]) {
									rotate(a = [0.0, 0.009638334792238598, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.761866423204978]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 72.51817267846829]) {
									rotate(a = [0.0, -0.007678715425310073, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -6.218030025324204]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "4", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "4", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 11.72912200619552);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -45.69297489717615]) {
									rotate(a = [0.0, 0.01283830465581784, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -5.578596778213037]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "6", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "6", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 12.022046783457489);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -169.369040018626]) {
									rotate(a = [0.0, 0.0115017040302349, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -6.226879485344163]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.125);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.125);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -25.714285714285715) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -51.42857142857143) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -77.14285714285714) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -102.85714285714286) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -128.57142857142858) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -154.28571428571428) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -205.71428571428572) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -231.42857142857142) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -257.14285714285717) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -282.85714285714283) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -308.57142857142856) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -334.2857142857143) {
																			translate(v = [0, 9.174897667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.09979533507099, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 11.72479533507099);
																		circle(r = 6.625);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 12.0824245242975]) {
									rotate(a = [0.0, -0.002006537290744085, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -11.897731270078339]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -71.26317408196358]) {
									rotate(a = [0.0, 0.01617991105029609, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -11.69645731249312]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 175.36548856743994]) {
									rotate(a = [0.0, 24.55987740632057, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -11.737285596343204]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 175.37183450922075]) {
									rotate(a = [0.0, -24.543220126625837, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -11.737050291522932]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -141.25265146690984]) {
									rotate(a = [0.0, 0.013282726400321798, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -11.787820980853738]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	translate(v = [0.0, 30.333333333333332, 0]) {
		translate(v = [0, 0, 7.084011126802119]) {
			rotate(a = [0, 90, 0]) {
				rotate(a = [0, -0.060641061377414096, 0]) {
					rotate(a = [0, 0, -131.03541043648272]) {
						color(alpha = 1.0, c = "dimgray") {
							difference() {
								sphere(r = 14.166666666666666);
								rotate(a = [0.0, 0.0, 131.03541043648272]) {
									rotate(a = [0.0, 0.060641061377414096, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -7.084011126802119]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.125);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.125);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = "4", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = "O", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = "4", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = "4", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = "O", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = "4", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 8.946650935536802, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.643301871073605, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 11.268301871073605);
																		circle(r = 6.625);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 7.53222969010542]) {
									rotate(a = [0.0, -0.02887087561313732, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -7.250465568529228]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = "4", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = "N", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = "3", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = "4", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = "N", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = "3", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 8.83533469671177, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.670669393423541, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 11.170669393423541);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -49.12478747442378]) {
									rotate(a = [0.0, 0.012308960611340906, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -12.364301569366404]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -107.48182732153171]) {
									rotate(a = [0.0, 0.007678715425310073, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -6.218030025324204]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "4", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "4", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 9.11456100309776, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.229122006195521, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 11.72912200619552);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -78.44506512121563]) {
									rotate(a = [0.0, 0.011785549226350387, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.12818375012958]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -138.44985949323245]) {
									rotate(a = [0.0, 0.0111832352945753, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.673674024791088]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -19.406143733656815]) {
									rotate(a = [0.0, 0.0023055862618767725, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.35452104524342]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 33.63990488819841]) {
									rotate(a = [0.0, -0.019477654275752404, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -11.513798787112211]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -152.06095575229267]) {
									rotate(a = [0.0, 18.214703098739985, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -13.977924515992884]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -152.05919659448344]) {
									rotate(a = [0.0, -18.193870865646375, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -13.977734546484667]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	translate(v = [0.0, 60.666666666666664, 0]) {
		translate(v = [0, 0, 10.090287081818532]) {
			rotate(a = [0, 90, 0]) {
				rotate(a = [0, -0.015858672998911805, 0]) {
					rotate(a = [0, 0, 103.48236861104965]) {
						color(alpha = 1.0, c = "dimgray") {
							difference() {
								sphere(r = 14.166666666666666);
								rotate(a = [0.0, 0.0, 70.84864922913452]) {
									rotate(a = [0.0, -0.025335351705816425, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -12.055967733196491]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 11.373195494076228]) {
									rotate(a = [0.0, 0.004189341657590868, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -7.1837717918245065]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = "6", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = "N", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = "1", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = "6", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = "N", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = "1", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 8.855077134799997, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.710154269599993, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 11.210154269599993);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 134.30702510282384]) {
									rotate(a = [0.0, -0.01283830465581784, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -5.578596778213037]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "6", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "6", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 9.261023391728745, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.522046783457489, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 12.022046783457489);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 101.55493487878437]) {
									rotate(a = [0.0, -0.011785549226350387, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.12818375012958]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 164.15286421122477]) {
									rotate(a = [0.0, -0.0, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.41240392779475]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 39.956373017694936]) {
									rotate(a = [0.0, -0.009460235491302857, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.094142622222938]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -103.48236861104965]) {
									rotate(a = [0.0, 0.015858672998911805, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.090287081818532]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.125);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.125);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = "6", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = "H", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = "6", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = "6", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = "H", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = "6", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 7.7844350119176555, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.318870023835311, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 8.943870023835311);
																		circle(r = 6.625);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -14.638520834049102]) {
									rotate(a = [0.0, 0.0223712372863124, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -11.485844035338115]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -171.4862556725194]) {
									rotate(a = [0.0, 0.004329989039308159, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -13.309850533933059]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	translate(v = [30.333333333333332, 0.0, 0]) {
		translate(v = [0, 0, 10.080149665461152]) {
			rotate(a = [0, 90, 0]) {
				rotate(a = [0, 54.27348369484168, 0]) {
					rotate(a = [0, 0, -137.4025651907098]) {
						color(alpha = 1.0, c = "dimgray") {
							difference() {
								sphere(r = 14.166666666666666);
								rotate(a = [0.0, 0.0, 67.07032001050601]) {
									rotate(a = [0.0, 0.01607814693089142, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -12.725714967428804]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 10.630959981374003]) {
									rotate(a = [0.0, -0.0115017040302349, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -6.226879485344163]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -25.714285714285715) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -51.42857142857143) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -77.14285714285714) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -102.85714285714286) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -128.57142857142858) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -154.28571428571428) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -205.71428571428572) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -231.42857142857142) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -257.14285714285717) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -282.85714285714283) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -308.57142857142856) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -334.2857142857143) {
																			translate(v = [0, 9.112397667535495, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 5.22479533507099, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 11.72479533507099);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 41.550140506767555]) {
									rotate(a = [0.0, -0.0111832352945753, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.673674024791088]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -15.847135788775256]) {
									rotate(a = [0.0, -0.0, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.41240392779475]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -38.90838261865045]) {
									rotate(a = [0.0, 0.0062173732001773304, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -13.704633932817247]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 137.37723754777693]) {
									rotate(a = [0.0, 54.27398477837844, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.080155682694983]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -20.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -40.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -80.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "H", valign = "center");
																			}
																		}
																		rotate(a = -100.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -140.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "1", valign = "center");
																			}
																		}
																		rotate(a = -160.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -200.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -220.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -260.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "H", valign = "center");
																			}
																		}
																		rotate(a = -280.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -320.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = "1", valign = "center");
																			}
																		}
																		rotate(a = -340.0) {
																			translate(v = [0, 7.727070068249905, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4541401364998094, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 8.95414013649981);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 137.4025651907098]) {
									rotate(a = [0.0, -54.27348369484168, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.080149665461152]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.125);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.125);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -20.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -40.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -80.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "H", valign = "center");
																			}
																		}
																		rotate(a = -100.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -140.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "2", valign = "center");
																			}
																		}
																		rotate(a = -160.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -200.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -220.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -260.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "H", valign = "center");
																			}
																		}
																		rotate(a = -280.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -320.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = "2", valign = "center");
																			}
																		}
																		rotate(a = -340.0) {
																			translate(v = [0, 7.7895731149528995, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.329146229905799, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 8.954146229905799);
																		circle(r = 6.625);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -101.23092933617811]) {
									rotate(a = [0.0, 0.010463335308133603, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.079853589581626]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -20.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -40.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -80.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "H", valign = "center");
																			}
																		}
																		rotate(a = -100.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -140.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "3", valign = "center");
																			}
																		}
																		rotate(a = -160.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -200.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -220.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -260.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "H", valign = "center");
																			}
																		}
																		rotate(a = -280.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "5", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "*", valign = "center");
																			}
																		}
																		rotate(a = -320.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = "3", valign = "center");
																			}
																		}
																		rotate(a = -340.0) {
																			translate(v = [0, 7.727223022355006, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 2.4544460447100125, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 8.954446044710012);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	translate(v = [30.333333333333332, 30.333333333333332, 0]) {
		translate(v = [0, 0, 7.091973753761678]) {
			rotate(a = [0, 90, 0]) {
				rotate(a = [0, -0.04652959603487919, 0]) {
					rotate(a = [0, 0, -11.08727687379457]) {
						color(alpha = 1.0, c = "dimgray") {
							difference() {
								sphere(r = 14.166666666666666);
								rotate(a = [0.0, 0.0, 11.08727687379457]) {
									rotate(a = [0.0, 0.04652959603487919, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -7.091973753761678]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.125);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.125);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = "2", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = "O", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = "2", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = "2", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = "O", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = "2", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 8.94435030640018, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.63870061280036, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 11.26370061280036);
																		circle(r = 6.625);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 133.8075378466808]) {
									rotate(a = [0.0, -0.03282285591604247, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -7.273232320092309]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = "2", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = "N", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = "3", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = "2", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = "N", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = "3", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 8.828538805963342, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.657077611926685, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 11.157077611926685);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -111.86897070598876]) {
									rotate(a = [0.0, 0.02067205694408882, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -7.240009815459711]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cylinder(center = true, h = 8.0, r = 1.0);
													translate(v = [5.0, 0, 0]) {
														cylinder(center = true, h = 8.0, r = 1.0);
													}
													translate(v = [0, 0, -0.5]) {
														linear_extrude(height = 1) {
															mirror(v = [0, 1, 0]) {
																intersection() {
																	union() {
																		square(size = 0);
																		rotate(a = 0.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -30.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = "2", valign = "center");
																			}
																		}
																		rotate(a = -60.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -90.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = "N", valign = "center");
																			}
																		}
																		rotate(a = -120.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = "1", valign = "center");
																			}
																		}
																		rotate(a = -150.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = " ", valign = "center");
																			}
																		}
																		rotate(a = -180.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = "C", valign = "center");
																			}
																		}
																		rotate(a = -210.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = "2", valign = "center");
																			}
																		}
																		rotate(a = -240.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = "-", valign = "center");
																			}
																		}
																		rotate(a = -270.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = "N", valign = "center");
																			}
																		}
																		rotate(a = -300.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = "1", valign = "center");
																			}
																		}
																		rotate(a = -330.0) {
																			translate(v = [0, 8.83844607261351, 0]) {
																				text(font = "Liberation Sans:style=Bold", halign = "center", size = 4.6768921452270185, text = " ", valign = "center");
																			}
																		}
																	}
																	difference() {
																		circle(r = 11.176892145227018);
																		circle(r = 6.5);
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -167.9175754757025]) {
									rotate(a = [0.0, 0.002006537290744085, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -11.897731270078339]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 160.59385626634318]) {
									rotate(a = [0.0, -0.0023055862618767725, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.35452104524342]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -140.04362698230506]) {
									rotate(a = [0.0, 0.009460235491302857, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -10.094142622222938]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, 107.75397481002882]) {
									rotate(a = [0.0, -0.022199774249774668, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -11.529181340979322]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
								rotate(a = [0.0, 0.0, -86.53927896787314]) {
									rotate(a = [0.0, 0.033096811029117955, 0.0]) {
										rotate(a = [0.0, -90.0, 0.0]) {
											translate(v = [0, 0, -11.564084691982766]) {
												union() {
													translate(v = [-21.25, -21.25, -42.5]) {
														cube(size = 42.5);
													}
													cube(size = 0);
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
