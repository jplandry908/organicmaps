layout (location = 0) in vec2 v_colorTexCoords;
layout (location = 1) in vec2 v_maskTexCoords;

layout (location = 0) out vec4 v_FragColor;

layout (binding = 0) uniform UBO
{
  mat4 u_modelView;
  mat4 u_projection;
  mat4 u_pivotTransform;
  vec2 u_contrastGamma;
  float u_opacity;
  float u_zScale;
  float u_interpolation;
  float u_isOutlinePass;
};

layout (binding = 1) uniform sampler2D u_colorTex;
layout (binding = 2) uniform sampler2D u_maskTex;

void main()
{
  vec4 finalColor = texture(u_colorTex, v_colorTexCoords) * texture(u_maskTex, v_maskTexCoords);
  finalColor.a *= u_opacity;
  v_FragColor = finalColor;
}
