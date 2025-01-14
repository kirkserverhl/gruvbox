const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0f0f0f", /* black   */
  [1] = "#933737", /* red     */
  [2] = "#A23D3D", /* green   */
  [3] = "#994848", /* yellow  */
  [4] = "#7B7F80", /* blue    */
  [5] = "#7C8080", /* magenta */
  [6] = "#8D8D8D", /* cyan    */
  [7] = "#c3c3c3", /* white   */

  /* 8 bright colors */
  [8]  = "#6c5959",  /* black   */
  [9]  = "#933737",  /* red     */
  [10] = "#A23D3D", /* green   */
  [11] = "#994848", /* yellow  */
  [12] = "#7B7F80", /* blue    */
  [13] = "#7C8080", /* magenta */
  [14] = "#8D8D8D", /* cyan    */
  [15] = "#c3c3c3", /* white   */

  /* special colors */
  [256] = "#0f0f0f", /* background */
  [257] = "#c3c3c3", /* foreground */
  [258] = "#c3c3c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
