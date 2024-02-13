shader_type sky;

uniform vec3 skyColor : source_color;
uniform vec3 horizonColor: source_color;

uniform float horizonBlend: hint_range(0.01, 1) = 0.05;
uniform float horizonLevel: hint_range(-0.5, 0.5) = 0;

void sky() {
	float col = clamp(EYEDIR.y/horizonBlend+horizonLevel,0.0,1.0);
	vec3 finalCol = mix(horizonColor,skyColor,col);
	COLOR = finalCol;
}
