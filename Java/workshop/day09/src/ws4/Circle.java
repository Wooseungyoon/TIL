package ws4;

public class Circle extends Shape{
	
	private int radius;
	private String color;
	
	public Circle() {
	}
	public Circle(int radius) {
		this.radius = radius;
	}
	
	public Circle(Point point, int radius) {
		super(point);
		this.radius = radius;
	}
	public Circle(Point point, int radius, String color) {
		super(point);
		this.radius = radius;
		this.color = color;
	}
	
	public int getRadius() {
		return radius;
	}
	public void setRadius(int radius) {
		this.radius = radius;
	}
	@Override
	public String toString() {
		return "Circle [point=" + point + ", radius=" + radius + ", color=" + color + "]";
	}
	@Override
	public double getArea() {
		double result = 0.0;
		result = Math.PI*radius*radius;
		return result;
	}
	@Override
	public double getCircume() {
		double result =0.0;
		result = Math.PI*2*radius;
		return result;
	}

	

	
	

}
