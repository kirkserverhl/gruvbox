const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0f1111", /* black   */
  [1] = "#B36543", /* red     */
  [2] = "#B7934F", /* green   */
  [3] = "#66938C", /* yellow  */
  [4] = "#9A9D8B", /* blue    */
  [5] = "#85A597", /* magenta */
  [6] = "#BCAD93", /* cyan    */
  [7] = "#c3c3c3", /* white   */

  /* 8 bright colors */
  [8]  = "#596d6d",  /* black   */
  [9]  = "#B36543",  /* red     */
  [10] = "#B7934F", /* green   */
  [11] = "#66938C", /* yellow  */
  [12] = "#9A9D8B", /* blue    */
  [13] = "#85A597", /* magenta */
  [14] = "#BCAD93", /* cyan    */
  [15] = "#c3c3c3", /* white   */

  /* special colors */
  [256] = "#0f1111", /* background */
  [257] = "#c3c3c3", /* foreground */
  [258] = "#c3c3c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
